local map = vim.keymap.set

map('n', '<leader>/', ':nohlsearch<CR>', { silent = true, desc = "Removes highlighting" })
map('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Substitute all occurrences of the word under the cursor" })

-- Search the word under the cursor in all files inside the working directory.
map('n', '<leader>fw', [[:Ack -w <C-r><C-w><Left><Left>]], { desc = "Search the word under the cursor" })

map('n', '\\', ':Ack ', { desc = "Find in files using ferret" })

map('n', 'j', 'gj', { desc = "Move one line up" })
map('n', 'k', 'gk', { desc = "Move one line down" })

-- Disable the help key (F1) across insert, normal, and visual modes:
map('i', '<F1>', '<ESC>', { desc = "Esc" })
map('n', '<F1>', '<ESC>', { desc = "Esc" })
map('v', '<F1>', '<ESC>', { desc = "Esc" })

-- Shortcut to exit back to normal mode in insert mode:
map('i', 'jj', '<ESC>', { desc = "Esc" })

-- Shortcut for ':' key in normal mode:
map('n', ';', ':')

map('n', '<C-j>', ':cn<CR>', { silent = true, desc = "Display the next item from the quickfix list" })
map('n', '<C-k>', ':cp<CR>', { silent = true, desc = "Display the previous item from the quickfix list" })

-- Disables the arrow keys and page navigation keys in normal mode.
-- Mapping these keys to <Nop> (no operation) prevents any default action when they are pressed.
-- Done to encourage the use of h/j/k/l for navigation, helping to build muscle memory
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')
map('n', '<PageUp>', '<Nop>')
map('n', '<PageDown>', '<Nop>')

map('t', '<Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })

map('n', '<leader>gc', [=[<cmd>execute "silent Git add ." <bar> G commit<cr>]=], { silent = true, desc = "Git: commit all" })
map('n', '<leader>gp', [=[<cmd>botright Git! push | wincmd p<cr>]=], { silent = true, desc = "Git: push" })
map('n', '<leader>gg', [=[<cmd>Gedit :<cr>]=], { silent = true, desc = "Git: Open fugitive" })
map('n', '<leader>gb', [=[<cmd>Git blame<cr>]=], { silent = true, desc = "Git: blame"})


local function set_current_file_path_to_default_reg()
  vim.fn.setreg('+', vim.fn.expand('%'))
end

map('n', '<leader>fc', set_current_file_path_to_default_reg, { desc = "Copy current file path" })

map({'n', 'v'}, '<leader>p', '"0p', { desc = "Paste without overriding the default register" })

map('n', '<leader><leader>', ':wa<CR>', { silent = true, desc = "Saves all buffers" })
map('n', '<leader>qq', ':q<CR>', { silent = true, desc = "Quits the current window" })
map('n', '<leader>qw', ':w<CR>', { silent = true, desc = "Writes the current file" })
map('n', '<leader>qo', [[:%bd | e#<CR>]], { silent = true, desc = "Deletes all but current buffer" })

map('n', 'gp', '`[v`]', { desc = "Select last changed text" })


local function check_and_remove_empty_line()
    local line = vim.fn.getline('.')
    if string.match(line, "^%s+$") ~= nil then
        local key = vim.api.nvim_replace_termcodes('<ESC>kJA', true, true, true)
        vim.api.nvim_feedkeys(key, 'i', true)
    end
end

local function paste_in_insert_with_autofromat()
    local key = vim.api.nvim_replace_termcodes('<C-r><C-p>"', true, true, true)
    vim.api.nvim_feedkeys(key, 'i', true)
    vim.schedule(check_and_remove_empty_line)
end

map('i', '<C-v>', paste_in_insert_with_autofromat, { noremap = true, silent = true, desc = "Paste and autoformat" })

vim.g.wordmotion_mappings = {
  w  = '<leader>w',
  b  = '<leader>b',
  e  = '<leader>e',
  ge = 'g<leader>e',
  aw = 'a<leader>w',
  iw = 'i<leader>w',
}
