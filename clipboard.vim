" Makes Vim use the system clipboard as the default register
if has("clipboard")
    set clipboard^=unnamed " copy to the system clipboard
    if has("unnamedplus") && executable("xsel") " X11 support
        set clipboard^=unnamedplus
        augroup ClipboardConfig
            " Clear all existing autocommands in this group
            autocmd!
            " Prevent vim from clearing the clipboard on exit
            autocmd VimLeave * call system("xsel -ib", getreg('+'))
        augroup end
    endif
endif
