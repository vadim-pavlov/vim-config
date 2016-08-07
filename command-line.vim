" wildmenu and wildmode are used for command line completion. The simplest way
" to try it would be with :color <Tab>: the command line is "expanded"
" vertically with a list of all the colorschemes available on your machine
" displayed in columns and an horizontal strip that you can navigate with <Tab>
" (forward) and <S-Tab> (backward).
"
" The behaviour of command line completion and wildmenu are dependant on
" wildmode. (http://stackoverflow.com/a/9511657/1145982)
set wildmenu
set wildmode=list:longest,full
