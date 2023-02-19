call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'sainnhe/everforest'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tweekmonster/braceless.vim'
Plug 'machakann/vim-sandwich'
Plug 'ap/vim-css-color'
Plug 'chaoren/vim-wordmotion'
Plug 'andymass/vim-matchup'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'kana/vim-textobj-user'
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'tommcdo/vim-exchange'
Plug 'ggandor/leap.nvim'
Plug 'kyoh86/vim-ripgrep'
Plug 'windwp/nvim-autopairs'

Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-ts-autotag'

" All of Plugins must be added before this line
" Adds plugins to &runtimepath
call plug#end()
