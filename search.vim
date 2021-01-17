" shows the matching part of the pair for [] {} and ()
set showmatch

" highlights search terms
set hlsearch

" shows search matches as you type
set incsearch

" A file that matches with one of these patterns is ignored when completing
" file or directory names, and influences the result of expand(), glob() and
" globpath()
set wildignore=*.swp,*.bak,*.pyc

if executable('ag') " if the Silver Searcher installed...
    " Use it over grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column\ $*
    set grepformat=%f:%l:%c:%m
endif
