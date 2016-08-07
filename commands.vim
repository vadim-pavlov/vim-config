" When you forgot to sudo before editing a file that requires root privileges
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

if executable('ag') " if the Silver Searcher installed...
    " Add 'Ag' command for it.
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args> |redraw!|cr
endif
