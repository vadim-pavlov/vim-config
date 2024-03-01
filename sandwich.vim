" Sets f to match method calls, e.g. foo.bar(arg)
let g:sandwich#magicchar#f#patterns = [
\   {
\     'header' : '\<\%(\h\k*\.\)*\h\k*',
\     'bra'    : '(',
\     'ket'    : ')',
\     'footer' : '',
\   },
\ ]

let g:sandwich_no_default_key_mappings = 1
" Disable ib, is, ab and as text objects provided by sandwitch in favor of
" similar objects from trgets.vim
let g:textobj_sandwich_no_default_key_mappings = 1

" add
nmap za <Plug>(sandwich-add)
xmap za <Plug>(sandwich-add)
omap za <Plug>(sandwich-add)

" delete
nmap zd <Plug>(sandwich-delete)
xmap zd <Plug>(sandwich-delete)
nmap zdb <Plug>(sandwich-delete-auto)

" replace
nmap zr <Plug>(sandwich-replace)
xmap zr <Plug>(sandwich-replace)
nmap zrb <Plug>(sandwich-replace-auto)
