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
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" Search the word under the cursor in all files inside the working directory
nnoremap <leader>S :Rg -w "<C-r><C-w>"<Left><Left>
nnoremap \ :Rg<SPACE>
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
map <C-d> :cn<CR>
" Displays the previous error from the quickfix list
map <C-a> :cp<CR>

" Quick move around split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Increases height of the current window
nnoremap <silent> <leader>] :exe "resize +10"<CR>
" Decreases height of the current window
nnoremap <silent> <leader>[ :exe "resize -10"<CR>

" Move with hjkl in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

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

inoremap <C-t>1 <esc><cmd>lua _G.term1:toggle()<cr>
nnoremap <C-t>1 <cmd>lua _G.term1:toggle()<cr>
tnoremap <C-t>1 <cmd>lua _G.term1:toggle()<cr>

inoremap <C-t>2 <esc><cmd>lua _G.term2:toggle()<cr>
nnoremap <C-t>2 <cmd>lua _G.term2:toggle()<cr>
tnoremap <C-t>2 <cmd>lua _G.term2:toggle()<cr>

inoremap <C-t>3 <esc><cmd>lua _G.term3:toggle()<cr>
nnoremap <C-t>3 <cmd>lua _G.term3:toggle()<cr>
tnoremap <C-t>3 <cmd>lua _G.term3:toggle()<cr>

nnoremap <leader>ga <cmd>Git add .<cr>
nnoremap <leader>gc <cmd>Git commit -v<cr>
nnoremap <leader>gp <cmd>Git push origin<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>- <cmd>lua toggle_nvimtree_replacing()<CR>
" copies the current file path to the default register
nnoremap <leader>fc :let @+ = expand("%")<cr>

" delete without overriding the default register
nnoremap <leader>d "0d
vnoremap <leader>d "0d

" paste without overriding the default register
xnoremap <leader>p "0p

" yank the whole file
nnoremap <leader>Y ggyG

" save the buffer if modified
nnoremap <leader>  :wa<CR>

" selects the last changed text
nnoremap gp `[v`]

" Expand or jump to available snippet
imap <expr> <C-s> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-s>'
smap <expr> <C-s> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-s>'

" Jump to the previous placeholder
imap <expr> <C-f> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-f>'
smap <expr> <C-f> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-f>'

" Disable ib, is, ab and as text objects provided by sandwitch in favor of
" similar objects from trgets.vim
let g:textobj_sandwich_no_default_key_mappings = 1

let g:wordmotion_mappings = {
\ 'w' : '<leader>w',
\ 'b' : '<leader>b',
\ 'e' : '<leader>e',
\ 'ge' : 'g<leader>e',
\ 'aw' : 'a<leader>w',
\ 'iw' : 'i<leader>w',
\ }
