" Enables all vim features. Required for plugins.
set nocompatible

let s:pathSeparator = !exists('+shellslash') || &shellslash ? '/' : '\'

let s:configRoot = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
    \ . s:pathSeparator

exe 'source ' s:configRoot . 'plugins.lua'
exe 'source ' s:configRoot . 'keys.vim'
exe 'source ' s:configRoot . 'backup.vim'
exe 'source ' s:configRoot . 'title.vim'
exe 'source ' s:configRoot . 'scroll.vim'
exe 'source ' s:configRoot . 'search.vim'
exe 'source ' s:configRoot . 'indent.vim'
exe 'source ' s:configRoot . 'appearance.vim'
exe 'source ' s:configRoot . 'lualine.lua'
exe 'source ' s:configRoot . 'clipboard.vim'
exe 'source ' s:configRoot . 'lsp.lua'
exe 'source ' s:configRoot . 'diagnosticls.lua'
exe 'source ' s:configRoot . 'devicons.lua'
exe 'source ' s:configRoot . 'nvimtree.lua'
exe 'source ' s:configRoot . 'sandwich.vim'
exe 'source ' s:configRoot . 'treesitter.lua'
exe 'source ' s:configRoot . 'mouse.vim'
exe 'source ' s:configRoot . 'autopairs.lua'
exe 'source ' s:configRoot . 'gitsigns.lua'
exe 'source ' s:configRoot . 'fidget.lua'
exe 'source ' s:configRoot . 'swap.vim'
exe 'source ' s:configRoot . 'spell.vim'
exe 'source ' s:configRoot . 'debug.lua'
exe 'source ' s:configRoot . 'leap.lua'
exe 'source ' s:configRoot . 'neotest.lua'
exe 'source ' s:configRoot . 'obsidian.lua'
exe 'source ' s:configRoot . 'ferret.lua'
exe 'source ' s:configRoot . 'localrc.vim'
