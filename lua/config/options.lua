vim.g.mapleader = " "

-- Highlights the maximum line length. Useful to align text.
vim.opt.colorcolumn = "80"

-- Shows the line number relative to the cursor, along with the absolute number.
vim.opt.relativenumber = true
vim.opt.number = true

-- Displays unprintable characters.
vim.opt.list = true

-- Customize the way unprintable characters are shown.
vim.opt.listchars = { tab = ">-", trail = "·", extends = ">", precedes = "<" }

-- Makes unnecessary whitespace more prominent.
vim.cmd([[ hi ExtraWhitespace ctermbg=238 guibg=#444444 ]])
vim.cmd([[ match ExtraWhitespace /\s\+$/ ]])

-- Removes the current mode name from the last line, as it is already shown in the status bar.
vim.opt.showmode = false

-- Always show the signcolumn to prevent text shifting when diagnostics change.
vim.opt.signcolumn = "yes:2"

-- Highlights the current line in every window and updates as the cursor moves.
vim.opt.cursorline = true

-- Sets the number of spaces that a tab character appears as.
-- This makes each tab equal to 4 spaces.
vim.opt.tabstop = 4

-- Controls the number of spaces a tab counts for while editing.
-- With softtabstop set to 4, pressing Tab in insert mode will insert (or remove) 4 spaces.
vim.opt.softtabstop = 4

-- Determines the number of spaces used for each step of (auto) indentation.
-- When indenting code, Neovim will add or remove 4 spaces per indent level.
vim.opt.shiftwidth = 4

-- Enables the conversion of tabs into spaces.
-- Instead of inserting a literal tab character, Neovim inserts spaces, ensuring consistent formatting.
vim.opt.expandtab = true

-- Disables automatic line wrapping.
-- Long lines will remain on a single line and require horizontal scrolling.
vim.opt.wrap = false

-- Keeps the cursor vertically centered
vim.opt.scrolloff = 999

-- Excludes files matching the specified patterns from file completion,
-- preventing temporary swap files (*.swp), backup files (*.bak), and compiled Python files (*.pyc)
-- from appearing when using filename expansion (wildcard matching) in Neovim.
vim.opt.wildignore = {"*.swp", "*.bak", "*.pyc"}

-- Sets the program used for the :grep command.
-- Here, it configures Neovim to use "ripgrep" (rg), a fast search tool.
-- The options used are:
--   - H: Always print the filename in the results.
--   --no-heading: Do not show a heading with the filename; each result is printed on a separate line.
--   --vimgrep: Format the output in a way that is compatible with Vim's quickfix list.
vim.opt.grepprg = "rg -H --no-heading --vimgrep"

-- Defines the format of the lines in the quickfix list based on the grep output.
-- The format string "%f:%l:%c:%m" tells Neovim to interpret each result as:
--   %f: filename,
--   %l: line number,
--   %c: column number,
--   %m: the message (the matching text).
vim.opt.grepformat = "%f:%l:%c:%m"

-- Appends "unnamedplus" to the clipboard setting.
-- This enables Neovim to use the system clipboard for all yank, delete, and paste operations,
-- allowing seamless copy and paste between Neovim and other applications.
vim.opt.clipboard:append("unnamedplus")

-- Configures how backups are created when saving files.
-- With backupcopy set to "yes", Neovim copies the file to create a backup
-- instead of renaming it. This approach preserves file permissions and inode,
-- which can be important when working with symbolic links or networked files.
vim.opt.backupcopy = "yes"

-- Disables mouse support in Neovim.
-- By setting the 'mouse' option to an empty string, no mouse functionalities
-- (such as clicking, scrolling, or selecting text with the mouse) will be enabled.
vim.opt.mouse = ""

-- This sets the backspace option to allow deletion over indents, line breaks, and the start of insert mode.
vim.opt.backspace = { "indent", "eol", "start" }

-- Neovim will not create temporary swap files when editing.
vim.opt.swapfile = false

-- With this option set to true, Neovim updates the window title to reflect the current file,
-- status, or other details defined in the 'titlestring' setting.
vim.opt.title = true
