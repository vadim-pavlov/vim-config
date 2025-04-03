vim.api.nvim_create_autocmd('User', {
    pattern = "OilActionsPre",
    callback = function(ev)
      local util = require("oil.util")
      for _, action in ipairs(ev.data.actions) do
        if action.type == "delete" then
          local src_scheme, src_path = util.parse_url(action.url)
          assert(src_path)
          local bufnr = vim.fn.bufnr(src_path)
          if bufnr ~= -1 then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end
      end
    end,
})

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = true,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = "unmodified",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function(_, opts)
      require("oil").setup(opts)
    end,
    keys = {
      {"<leader>-", "<cmd>Oil<cr>", { desc = "Open parent directory" }},
    }
  }
}
