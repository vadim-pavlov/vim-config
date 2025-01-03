local DEFAULT_SELECT_MODES = {
  ['@parameter.outer'] = 'v',
  ['@assignment.outer'] = 'V',
  ['@function.outer'] = 'v',
  ['@class.outer'] = 'V',
}

local PYTHON_SELECT_MODES = {
  ['@parameter.outer'] = 'v',
  ['@assignment.outer'] = 'V',
  ['@function.inner'] = 'V',
  ['@function.outer'] = 'V',
  ['@block.inner'] = 'V',
  ['@block.outer'] = 'V',
  ['@class.outer'] = 'V',
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "javascript", "python", "html", "help", "vim", "lua", "help", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {"help"},

  autotag = {
    enable = true,
    filetypes = { "html" , "xml", "jshtml" },
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ak"] = "@condition.outer",
        ["ik"] = "@condition.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["iq"] = "@call.inner",
        ["aq"] = "@call.outer",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["aj"] = "@assignment.lhs",
        ["ak"] = "@assignment.outer",
        ["al"] = "@assignment.rhs",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = function()
        if vim.bo.filetype == "python" then
          return PYTHON_SELECT_MODES
        end
        return DEFAULT_SELECT_MODES
      end,
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]b"] = "@block.outer",
        ["]a"] = "@parameter.inner",
        ["]t"] = "@tag.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.inner",
        ["]C"] = "@class.inner",
        ["]B"] = "@block.inner",
        ["]T"] = "@tag.inner",
        ["]A"] = "@parameter.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[b"] = "@block.outer",
        ["[t"] = "@tag.outer",
        ["[a"] = "@parameter.inner",
      },
      goto_previous_end = {
        ["[F"] = "@function.inner",
        ["[C"] = "@class.inner",
        ["[B"] = "@block.inner",
        ["[T"] = "@tag.inner",
        ["[A"] = "@parameter.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>xf"] = "@function.outer",
        ["<leader>xc"] = "@class.outer",
        ["<leader>xb"] = "@block.outer",
        ["<leader>xa"] = "@parameter.inner",
        ["<leader>xt"] = "@tag.outer",
      },
      swap_previous = {
        ["<leader>xF"] = "@function.outer",
        ["<leader>xC"] = "@class.outer",
        ["<leader>xB"] = "@block.outer",
        ["<leader>xT"] = "@tag.outer",
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gm", -- set to `false` to disable one of the mappings
      node_incremental = "gm",
      scope_incremental = false,
      node_decremental = false,
    },
  },
  matchup = {
    enable = true,
  },
}
