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

" Syntastic is a syntax checking plugin that runs files through
" external syntax checkers and displays any resulting errors to the user.
Plug 'scrooloose/syntastic'

" Airline is a fast and lightweight status/tabline.
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline.
Plug 'vim-airline/vim-airline-themes'

" UltiSnips is a snippet engine which allows you to quickly insert predefined
" chunks of text into your document.
Plug 'SirVer/ultisnips'

" A collection of snippets for various programming languages.
Plug 'honza/vim-snippets'

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine.
Plug 'Valloric/YouCompleteMe',
    \ { 'do': './install.py --tern-completer --clang-completer' }

" All of Plugins must be added before this line
" Adds plugins to &runtimepath
call plug#end()
