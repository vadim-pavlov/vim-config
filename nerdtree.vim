" Show hidden files, too
let g:NERDTreeShowFiles=1
let g:NERDTreeShowHidden=1

" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

" Ignores files in NERDTree
let g:NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

" When a NERDTree instance is opened in place of a file, the following function
" finds and selects such file in the file tree.
function! SelectAlternateFileInNERDTree()
    let l:previous=expand('#:t')
    if l:previous != ''
        call search('\v<' . l:previous . '>')
    endif
endfunction

augroup NERDTreeConfigGroup
    " Clear all existing autocommands in this group
    autocmd!
    autocmd User NERDTreeInit call SelectAlternateFileInNERDTree()
augroup end
