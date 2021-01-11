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

" Del key in the insert mode
imap <C-L> <C-O>"_x

" Displays the next error from the quickfix list
map <C-D> :cn<CR>
" Displays the previous error from the quickfix list
map <C-A> :cp<CR>

" Quick move around split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set <S-F3>=[1;2R
let g:UltiSnipsExpandTrigger = "<F3>"
let g:UltiSnipsJumpForwardTrigger = "<F3>"
let g:UltiSnipsJumpBackwardTrigger = "<S-F3>"

if executable('ag') " if the Silver Searcher installed...
    " Add a shortcut for it
    nnoremap \ :Ag<SPACE>
endif


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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Semi-hard mode to break bad habits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>

nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
