if v:version >= 700
    augroup BufferConfigGroup
        " Clear all existing autocommands in this group
        autocmd!
        " Keeps window position when switching buffers.
        " Credits to: http://stackoverflow.com/a/4255960/1145982
        autocmd BufLeave * let b:winview = winsaveview()
        autocmd BufEnter * if(exists('b:winview')) |
            \ call winrestview(b:winview) | endif
    augroup end
endif
