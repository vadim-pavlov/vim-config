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


local function on_lsp_refs(options)
  vim.fn.setqflist({}, 'r', options)
  vim.cmd.cfirst()
end

local function on_lsp_defs(options)
  local modified_options = {
    title = options.title,
    items = { options.items[1] },
    context = options.context
  }
  vim.fn.setqflist({}, 'r', modified_options)
  vim.cmd.cfirst()
end

return {

  {

    'neovim/nvim-lspconfig',

    dependencies = { "hrsh7th/nvim-cmp" },

    config = function()

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.pyright.setup{
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

      lspconfig.diagnosticls.setup{
        filetypes = { "python" },
        init_options = {
          filetypes = {
            python = "flake8"
          },
          linters = {
            flake8 = {
              command = "flake8",
              debounce = 100,
              args = {
                "--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s",
                "-"
              },
              offsetLine = 0,
              offsetColumn = 0,
              sourceName = "flake8",
              formatLines = 1,
              formatPattern = {
                "(\\d+),(\\d+),([A-Z]),(.*)(\\r|\\n)*$",
                {
                  line = 1,
                  column = 2,
                  security = 3,
                  message = 4
                }
              },
              securities = {
                W = "warning",
                E = "error",
                F = "error",
                C = "error",
                N = "error"
              }
            }
          }
        }
      }

      lspconfig.jsonls.setup{}
      lspconfig.cssls.setup{}

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local bufopts = { noremap=true, silent=true, buffer = ev.buf }
          local map = vim.keymap.set;

          map('n', '<leader>lD', vim.lsp.buf.declaration, { desc = "Goto Declaration" } )
          map('n', '<leader>ld', function() vim.lsp.buf.definition({on_list = on_lsp_defs}) end, { desc = "Goto Definition" } )
          map('n', '<leader>lh', vim.lsp.buf.hover, { desc = "Hover" } )
          map('n', '<leader>li', vim.lsp.buf.implementation, { desc = "Goto Implementation" } )
          map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = "Signature Help" } )
          map('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = "Goto type Definition" } )
          map('n', '<leader>ln', vim.lsp.buf.rename, { desc = "Rename" } )
          map({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" } )
          map('n', '<leader>lr', function(context) vim.lsp.buf.references(context, {on_list = on_lsp_refs}) end, { desc = "References" } )
          map('n', '<leader>le', vim.diagnostic.open_float)
          map('n', '[d', vim.diagnostic.goto_prev)
          map('n', ']d', vim.diagnostic.goto_next)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client.name == "pyright" then
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
              custom_on_publish_diagnostics, {}
            )
          end

        end,
      })

    end,

  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("typescript-tools").setup({
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
      })
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client.name == "typescript-tools" then
            vim.keymap.set('n', '<leader>lu', function()
              require("typescript-tools.api").file_references(false);
            end, bufopts)
          end
        end,
      })
    end,
  },

}
