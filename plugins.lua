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
    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'sainnhe/everforest'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
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
    use 'kana/vim-textobj-user'
    use {'liuchengxu/vim-clap', run = ':call clap#installer#force_download()' }
    use 'hynek/vim-python-pep8-indent'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    use 'tommcdo/vim-exchange'
    use 'kyoh86/vim-ripgrep'
    use 'windwp/nvim-autopairs'

    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-ts-autotag'
    use 'j-hui/fidget.nvim'

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Must be at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end)
