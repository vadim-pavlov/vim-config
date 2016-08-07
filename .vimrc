" Enables all vim features. Required for plugins.
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

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
Plug 'Valloric/YouCompleteMe'

" All of Plugins must be added before this line
" Adds plugins to &runtimepath
call plug#end()

colorscheme apprentice
set t_Co=256

filetype plugin indent on

let python_highlight_all=1
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set textwidth=79
set fileformat=unix
set encoding=utf-8

" Sets <leader> to the space key
let mapleader=" "

" Ignores files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
nnoremap <silent> <leader>- :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>

function! AttemptSelectLastFile()
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction

if has('autocmd')
    autocmd User NERDTreeInit call AttemptSelectLastFile()
endif

" nmap <buffer> <expr> - g:NERDTreeMapUpdir
" Let <Leader><Leader> (^#) return from NERDTree window.
" let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

" Opens a NERDTree automatically when vim starts on
" autocmd vimenter * NERDTree

" Closes vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Turns on line numbers on the side of the screen
set nu

" highlight max allowed line length
set colorcolumn=80
highlight ColorColumn ctermbg=238 guibg=#444444

" Flagging Unnecessary Whitespace
highlight ExtraWhitespace ctermbg=238 guibg=#444444
match ExtraWhitespace /\s\+$/

set listchars=tab:>-,trail:·,extends:>,precedes:<
set list

let g:syntastic_check_on_wq=0
let g:syntastic_python_checkers=['flake8']
nnoremap <F4> :SyntasticCheck<CR>
" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

" show the matching part of the pair for [] {} and ()
set showmatch
highlight MatchParen ctermfg=red guifg=red

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" change the terminal's title
set title

set nobackup
set noswapfile

" remember more commands and search history
set history=1000

" Use many muchos levels of undo
set undolevels=1000

" A file that matches with one of these patterns is ignored when completing
" file or directory names, and influences the result of expand(), glob() and
" globpath()
set wildignore=*.swp,*.bak,*.pyc

" Enables the paste mode when <F2> key is pressed.
" Disables auto-indenting and auto-expansion of the user input.
" Handy for pasting data from the system clipboard.
set pastetoggle=<F2>

" This gets rid of the distracting highlighting once you’ve found what yor are
" looking for.
nmap <silent> ./ :nohlsearch<CR>

" Makes j and k yes work the way you expect instead of working in some archaic
" 'movement by file line instead of screen line' fashion.
nnoremap j gj
nnoremap k gk

" Gets rid of the  help key that you will invaribly hit constantly while
" aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" A shortcut for ':' key
nnoremap ; :

" Displays the next error from the quickfix list
map <C-j> :cn<CR>
" Displays the previous error from the quickfix list
map <C-k> :cp<CR>

" When you forgot to sudo before editing a file that requires root privileges
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" Enables AG (https://github.com/ggreer/the_silver_searcher)
"let g:ackprg = 'ag --vimgrep'
"let g:ack_qhandler = ""


if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column\ $*
    set grepformat=%f:%l:%c:%m
    command -nargs=+ -complete=file -bar Ag silent! grep! <args> | redraw! | cr
    nnoremap \ :Ag<SPACE>
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0
endif

set laststatus=2
au VimEnter * exec 'AirlineTheme bubblegum'
set noshowmode

"let g:ycm_python_binary_path = 'python'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_invoke_completion = '<tab>'
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<S-tab>']
"let g:SuperTabDefaultCompletionType = '<tab>'
" better key bindings for UltiSnipsExpandTrigger
set <S-F3>=[1;2R
let g:UltiSnipsExpandTrigger = "<F3>"
let g:UltiSnipsJumpForwardTrigger = "<F3>"
let g:UltiSnipsJumpBackwardTrigger = "<S-F3>"
" make YCM compatible with UltiSnips (using supertab)
