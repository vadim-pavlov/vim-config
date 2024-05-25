local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'sainnhe/everforest'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use 'tweekmonster/braceless.vim'
    use 'machakann/vim-sandwich'
    use 'ap/vim-css-color'
    use 'chaoren/vim-wordmotion'
    use {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    }
    use 'MarcWeber/vim-addon-local-vimrc'
    use 'hynek/vim-python-pep8-indent'

    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.5',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    }
    use "rafamadriz/friendly-snippets"

    use 'saadparwaiz1/cmp_luasnip'

    use 'kyoh86/vim-ripgrep'
    use 'windwp/nvim-autopairs'

    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-ts-autotag'
    use 'j-hui/fidget.nvim'

    use {
      "pmizio/typescript-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }
    use {
        'mfussenegger/nvim-dap',
        requires = {'nvim-neotest/nvim-nio'}
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use 'mxsdev/nvim-dap-vscode-js'
    use {
      "microsoft/vscode-js-debug",
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
    use 'tpope/vim-repeat'
    use 'ggandor/leap.nvim'
    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-neotest/neotest-python',
        'kenunq/django-neotest',
      }
    }
    -- use 'klen/nvim-test'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Must be at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end)
