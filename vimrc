" Enables all vim features. Required for plugins.
set nocompatible

let s:pathSeparator = !exists('+shellslash') || &shellslash ? '/' : '\'

let s:configRoot = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
    \ . s:pathSeparator

exe 'source ' s:configRoot . 'title.vim'
exe 'source ' s:configRoot . 'plugins.vim'
exe 'source ' s:configRoot . 'filetype.vim'
exe 'source ' s:configRoot . 'encoding.vim'
exe 'source ' s:configRoot . 'backup.vim'
exe 'source ' s:configRoot . 'history.vim'
exe 'source ' s:configRoot . 'buffer.vim'
exe 'source ' s:configRoot . 'search.vim'
exe 'source ' s:configRoot . 'indent.vim'
exe 'source ' s:configRoot . 'commands.vim'
exe 'source ' s:configRoot . 'command-line.vim'
exe 'source ' s:configRoot . 'keys.vim'
exe 'source ' s:configRoot . 'sound.vim'
exe 'source ' s:configRoot . 'appearance.vim'
exe 'source ' s:configRoot . 'clipboard.vim'
exe 'source ' s:configRoot . 'nerdtree.vim'
exe 'source ' s:configRoot . 'airline.vim'
exe 'source ' s:configRoot . 'ctrlp.vim'

silent! so .vimlocal
