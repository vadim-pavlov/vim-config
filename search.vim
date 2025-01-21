" A file that matches with one of these patterns is ignored when completing
" file or directory names, and influences the result of expand(), glob() and
" globpath()
set wildignore=*.swp,*.bak,*.pyc

set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m
