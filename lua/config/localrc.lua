local M = {}

-- Helper function to recursively search for a file starting from a given directory
local function find_file_upwards(filename, start)
  local dir = start or vim.fn.getcwd()
  while true do
    local filepath = dir .. "/" .. filename
    if vim.fn.filereadable(filepath) == 1 then
      return filepath
    end
    local parent = vim.fn.fnamemodify(dir, ":h")
    if parent == dir then
      break
    end
    dir = parent
  end
  return nil
end

local function confirm_local_rc(filename)
  -- Read file content and compute current hash.
  local content_lines = vim.fn.readfile(filename)
  local content = table.concat(content_lines, "\n")
  local current_hash = vim.fn.sha256(content)

  -- Prepare a persistent directory to store the hash.
  local data_dir = vim.fn.stdpath("data")
  local hash_dir = data_dir .. "/nvim_local_hashes"
  if vim.fn.isdirectory(hash_dir) == 0 then
    vim.fn.mkdir(hash_dir, "p")
  end
  -- Use the SHA256 of the file's path to create a unique file name.
  local key = vim.fn.sha256(filename)
  local hash_file = hash_dir .. "/" .. key .. ".txt"

  local stored_hash = nil
  if vim.fn.filereadable(hash_file) == 1 then
    stored_hash = table.concat(vim.fn.readfile(hash_file), "\n")
  end

  -- Compare the stored hash with the current one.
  if stored_hash ~= current_hash then
    local answer = vim.fn.input(
      filename .. " has changed (or is loaded for the first time). Load it? (y/n): "
    )
    if answer:lower() ~= "y" then
      vim.notify("Skipping " .. filename)
      return false
    end
    -- Update stored hash.
    vim.fn.writefile({ current_hash }, hash_file)
  end
  return true
end

function M.load()
  local local_rc_path = find_file_upwards(".vim/init.lua")
  if local_rc_path and confirm_local_rc(local_rc_path) then
    local ok, local_rc_module = pcall(dofile, local_rc_path)
    if not ok then
      vim.notify("Error: " .. local_rc_module, vim.log.levels.ERROR)
      return nil
    end
    return local_rc_module
  end
  return nil
end

return M
