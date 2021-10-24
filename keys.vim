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
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" Search the word under the cursor in all files inside the working directory
nnoremap <Leader>S :Rg -w "<C-r><C-w>"<Left><Left>
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

" Move with hjkl in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Semi-hard mode to break bad habits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>

nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
" <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>- <cmd>lua require("telescope.builtin").file_browser({cwd = vim.fn.expand("%") and vim.fn.expand("%:p:h") or "."})<cr>

" delete without overriding the default register
nnoremap <leader>d "0d
vnoremap <leader>d "0d

" paste without overriding the default register
xnoremap <leader>p "0p

" yank the whole file
nnoremap <leader>Y ggyG

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
