call plug#begin('~/.vim/plugged')

" Apprentice js a dark, low—contrast colorscheme.
Plug 'romainl/Apprentice'

Plug 'kyazdani42/nvim-web-devicons'

" Fugitive is a wrapper for Vim that complements the command line interface to
" Git. The plugin provides an interactive window, where you can stage and
" review your changes before the next commit or run any Git arbitrary command.
Plug 'tpope/vim-fugitive'

" A fix for vim's default indentation behavior.
Plug 'hynek/vim-python-pep8-indent'

" Airline is a fast and lightweight status/tabline.
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline.
Plug 'vim-airline/vim-airline-themes'

" instant increment completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'caenrique/nvim-toggle-terminal'

Plug 'jeetsukumaran/vim-pythonsense'

Plug 'tpope/vim-repeat'

Plug 'machakann/vim-sandwich'

Plug 'wellle/targets.vim'

Plug 'mattn/emmet-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'vadim-pavlov/telescope.nvim', {'branch': 'feat/fbrowser_file_actions'}

Plug 'ap/vim-css-color'

" All of Plugins must be added before this line
" Adds plugins to &runtimepath
call plug#end()
