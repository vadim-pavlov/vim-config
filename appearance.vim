" Enables Vim to show parts of the text in another font or color
syntax on

" Loads a file with :highlight commands
if !empty(globpath(&rtp, 'colors/apprentice.vim'))
    colorscheme apprentice
endif

" Even if the terminal supports 256 colors, it may not use the 256 colors by
" default  Setting 't_Co' to 256 should force Vim to use 256 colors.
set t_Co=256

" Highlights the maximum line length. Useful to align text.
set colorcolumn=80

" Used for the columns set with 'colorcolumn'.
highlight ColorColumn ctermbg=238 guibg=#444444

" The character under the cursor or just before it, if it is a paired bracket,
" and its match.
highlight MatchParen ctermfg=red guifg=red

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
highlight ExtraWhitespace ctermbg=238 guibg=#444444
match ExtraWhitespace /\s\+$/

" Makes the status bar always visible (even when there is only one window
" availble)
set laststatus=2

" Removes the current mode name from the last line as we already have it on
" the status bar.
set noshowmode

let python_highlight_all=1
