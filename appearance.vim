" Enables Vim to show parts of the text in another font or color
set termguicolors

set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

" Highlights the maximum line length. Useful to align text.
set colorcolumn=80

" Used for the columns set with 'colorcolumn'.
"hi ColorColumn ctermbg=238 guibg=#444444

" Shows the line number relative to the line with the cursor in front of each
" line
set relativenumber

" Displays display unprintable characters
set list

" Customize the way unprintable characters are shown.
"
"    tab:xy      Two characters to be used to show a tab.
"
"    space:c     Character to show for a space.
"
"    trail:c     Character to show for trailing spaces.
"
"    extends:c   Character to show in the last column, when 'wrap' is
"                off and the line continues beyond the right of the
"                screen.
"
"    precedes:c  Character to show in the first column, when 'wrap'
"                is off and there is text preceding the character
"                visible in the first column.
set listchars=tab:>-,trail:·,extends:>,precedes:<

" Makes unnecessary whitespace more prominent.
hi ExtraWhitespace ctermbg=238 guibg=#444444
match ExtraWhitespace /\s\+$/


" Removes the current mode name from the last line as we already have it on
" the status bar.
set noshowmode

"let python_highlight_all=1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes:2

" highlights the current line in every window and updates
" the highlight as the cursor moves
set cursorline
