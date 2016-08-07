augroup AirlineConfigGroup
    " Clear all existing autocommands in this group
    autocmd!
    " Sets the status bar theme
    autocmd VimEnter * exec 'AirlineTheme bubblegum'
augroup end
