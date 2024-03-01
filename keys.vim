" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Sets <leader> to the space key
let mapleader=" "

" Enables the paste mode when <F2> key is pressed.
" Disables auto-indenting and auto-expansion of the user input.
" Handy for pasting data from the system clipboard.
set pastetoggle=<F2>

" This gets rid of the distracting highlighting once you’ve found what yor are
" looking for.
nmap <silent> <leader>/ :nohlsearch<CR>

" Substitute all occurrences of the word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" Search the word under the cursor in all files inside the working directory
nnoremap <leader>fw :Rg -w "<C-r><C-w>"<Left><Left>
nnoremap \ :Rg<SPACE>
" Makes j and k yes work the way you expect instead of working in some archaic
" 'movement by file line instead of screen line' fashion.
nnoremap j gj
nnoremap k gk

" Gets rid of the  help key that you will invariably hit constantly while
" aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" A shortcut to exit back to normal mode
inoremap jj <ESC>
" Paste and autoformat from the insert mode
inoremap <C-v> <C-r><C-p>"

" A shortcut for ':' key
nnoremap ; :

" Displays the next error from the quickfix list
map <C-j> :cn<CR>
" Displays the previous error from the quickfix list
map <C-k> :cp<CR>

" Increases height of the current window
nnoremap <silent> <leader>] :exe "resize +10"<CR>
" Decreases height of the current window
nnoremap <silent> <leader>[ :exe "resize -10"<CR>

" Semi-hard mode to break bad habits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>

" <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Disable Ctrl-t to ease it usage in combination with other keys
noremap <C-t> <Nop>

nnoremap <leader>ga <cmd>Git add .<cr>
nnoremap <leader>gc <cmd>Git commit -v<cr>
nnoremap <leader>gp <cmd>Git push origin<cr>

nnoremap <leader>ff <cmd>Clap files<cr>
nnoremap <leader>fg <cmd>Clap grep<cr>
nnoremap <leader>fb <cmd>Clap buffers<cr>
nnoremap <leader>- <cmd>lua toggle_nvimtree_replacing()<CR>
" copies the current file path to the default register
nnoremap <leader>fc :let @+ = expand("%")<cr>

" delete without overriding the default register
nnoremap <leader>d "0d
vnoremap <leader>d "0d

" paste without overriding the default register
xnoremap <leader>p "0p

" save the buffer if modified
nnoremap <leader>  :wa<CR>

" selects the last changed text
nnoremap gp `[v`]

let g:wordmotion_mappings = {
\ 'w' : '<leader>w',
\ 'b' : '<leader>b',
\ 'e' : '<leader>e',
\ 'ge' : 'g<leader>e',
\ 'aw' : 'a<leader>w',
\ 'iw' : 'i<leader>w',
\ }
