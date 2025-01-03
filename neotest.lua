local Path = require("plenary.path")

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      is_test_file = function(file_path)
        local elems = vim.split(file_path, Path.path.sep)
        local file_name = elems[#elems]
        return string.match(file_name, "^test.-%.py$") ~= nil
      end
    })
  }
})
