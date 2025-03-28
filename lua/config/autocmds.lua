vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "html", "jshtml", "htmldjango", "lua", "json" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
