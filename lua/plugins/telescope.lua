return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Searches for the string under your cursor" },
    { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Live fuzzy search inside of the currently open buffer" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Lists previously open files" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Lists items in the quickfix list" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Lists open buffers in current neovim instance" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Lists available help tags" },
  }
}
