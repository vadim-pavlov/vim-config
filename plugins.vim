call plug#begin('~/.vim/plugged')

" Apprentice js a dark, low—contrast colorscheme.
Plug 'romainl/Apprentice'

" Fugitive is a wrapper for Vim that complements the command line interface to
" Git. The plugin provides an interactive window, where you can stage and
" review your changes before the next commit or run any Git arbitrary command.
Plug 'tpope/vim-fugitive'

" CtrlP is a file navigation plugin that supports fuzzy filename search on
" buffers, mru, and file system.
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree is a file explorer plugin that provides '"project drawer'
" functionality to your vim editing.
Plug 'scrooloose/nerdtree'

" A fix for vim's default indentation behavior.
Plug 'hynek/vim-python-pep8-indent'

" Airline is a fast and lightweight status/tabline.
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline.
Plug 'vim-airline/vim-airline-themes'

" UltiSnips is a snippet engine which allows you to quickly insert predefined
" chunks of text into your document.
Plug 'SirVer/ultisnips'

" A collection of snippets for various programming languages.
Plug 'honza/vim-snippets'

" instant increment completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'caenrique/nvim-toggle-terminal'

" All of Plugins must be added before this line
" Adds plugins to &runtimepath
call plug#end()
