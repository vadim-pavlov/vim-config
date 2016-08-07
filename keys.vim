" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Sets <leader> to the space key
let mapleader=","

nnoremap <silent> <leader>- :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>
nnoremap <F4> :SyntasticCheck<CR>

" Enables the paste mode when <F2> key is pressed.
" Disables auto-indenting and auto-expansion of the user input.
" Handy for pasting data from the system clipboard.
set pastetoggle=<F2>

" This gets rid of the distracting highlighting once you’ve found what yor are
" looking for.
nmap <silent> <leader>/ :nohlsearch<CR>

" Makes j and k yes work the way you expect instead of working in some archaic
" 'movement by file line instead of screen line' fashion.
nnoremap j gj
nnoremap k gk

" Gets rid of the  help key that you will invaribly hit constantly while
" aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" A shortcut to exit back to normal mode
inoremap jj <ESC>

" A shortcut for ':' key
nnoremap ; :

" Displays the next error from the quickfix list
map <C-j> :cn<CR>
" Displays the previous error from the quickfix list
map <C-k> :cp<CR>

let g:ycm_key_invoke_completion = '<tab>'
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<S-tab>']

set <S-F3>=[1;2R
let g:UltiSnipsExpandTrigger = "<F3>"
let g:UltiSnipsJumpForwardTrigger = "<F3>"
let g:UltiSnipsJumpBackwardTrigger = "<S-F3>"

if executable('ag') " if the Silver Searcher installed...
    " Add a shortcut for it
    nnoremap \ :Ag<SPACE>
endif
