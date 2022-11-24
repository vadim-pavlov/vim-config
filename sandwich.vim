" Sets f to match method calls, e.g. foo.bar(arg)
let g:sandwich#magicchar#f#patterns = [
\   {
\     'header' : '\<\%(\h\k*\.\)*\h\k*',
\     'bra'    : '(',
\     'ket'    : ')',
\     'footer' : '',
\   },
\ ]
