require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/obsidian/personal",
    },
    {
      name = "work",
      path = "~/obsidian/work",
    },
  },
})

vim.keymap.set('n', '<leader>on', ':ObsidianNew<cr>')
