if executable('ag') " if the Silver Searcher installed...
    " Use it in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
