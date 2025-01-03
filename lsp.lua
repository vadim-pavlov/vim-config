vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

local function filter(arr, func)
    -- Filter in place
    -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
    local new_index = 1
    local size_orig = #arr
    for old_index, v in ipairs(arr) do
        if func(v, old_index) then
            arr[new_index] = v
            new_index = new_index + 1
        end
    end
    for i = new_index, size_orig do arr[i] = nil end
end

local function pyright_accessed_filter(diagnostic)
    if string.match(diagnostic.message, '".+" is not accessed') then
        return false
    end
    return true
end

local function custom_on_publish_diagnostics(a, params, client_id, c, config)
    filter(params.diagnostics, pyright_accessed_filter)
    vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-e>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort()
            elseif luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- that way you will only jump inside the snippet region
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- VS Code style snippets
require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-H>", function() luasnip.jump(-1) end, {silent = true})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup{
    flags = lsp_flags,
    capabilities = capabilities,

    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
            }
        }
    }
}

require("typescript-tools").setup{
    flags = lsp_flags,
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "jshtml",
    },
    settings = {
        -- tsserver_logs = "verbose",
        tsserver_file_preferences = {
            importModuleSpecifierEnding = "js",
            autoImportFileExcludePatterns = {
                "**/core-js/",
            }
        },
    }
}

require('lspconfig').jsonls.setup{}
require('lspconfig').cssls.setup{}

local function on_lsp_list(options)
  vim.fn.setqflist({}, 'r', options)
  vim.api.nvim_command('cfirst')
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local bufopts = { noremap=true, silent=true, buffer = ev.buf }

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, bufopts)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client.name == "typescript-tools" then
        vim.keymap.set('n', '<leader>lu', function()
            require("typescript-tools.api").file_references(false);
        end, bufopts)
    end

    if client.name == "pyright" then
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            custom_on_publish_diagnostics, {})
    end

  end,
})

local defaultRefHandler = vim.lsp.handlers["textDocument/references"]
vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
    defaultRefHandler,
    {on_list=on_lsp_list}
)
