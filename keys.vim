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
nnoremap <leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>
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

" A shortcut for ':' key
nnoremap ; :

" Displays the next error from the quickfix list
map <C-j> :cn<CR>
" Displays the previous error from the quickfix list
map <C-k> :cp<CR>

" Ctrl backspace for deleting previous word in the insert mode
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

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
nnoremap <leader>gc <cmd>execute "silent Git add ." <bar> G commit<cr>
nnoremap <leader>gp <cmd>botright Git! push \| wincmd p<cr>
nnoremap <leader>gg <cmd>Gedit :<cr>
nnoremap <leader>gb <cmd>Git blame<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fz <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>- <cmd>lua toggle_nvimtree_replacing()<CR>
" copies the current file path to the default register
nnoremap <leader>fc :let @+ = expand("%")<cr>

" paste without overriding the default register
map <leader>p "0p

" save the buffer if modified
nnoremap <leader><leader> :wa<CR>

nnoremap <leader>qq :q<CR>
nnoremap <leader>qw :w<CR>
nnoremap <leader>qo :%bd\|e#<CR>

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


" Paste and autoformat from the insert mode
" inoremap <C-v> <C-r><C-p>"
lua << EOF

local function check_and_remove_empty_line()
    local line = vim.fn.getline('.')
    if string.match(line, "^%s+$") ~= nil then
        local key = vim.api.nvim_replace_termcodes('<ESC>kJA', true, true, true)
        vim.api.nvim_feedkeys(key, 'i', true)
    end
end

local function paste_in_insert_with_autofromat()
    local key = vim.api.nvim_replace_termcodes('<C-r><C-p>"', true, true, true)
    vim.api.nvim_feedkeys(key, 'i', true)
    vim.schedule(check_and_remove_empty_line)
end

vim.keymap.set('i', '<C-v>', paste_in_insert_with_autofromat, { noremap = true, silent = true, desc = "Paste and autoformat" })

EOF
