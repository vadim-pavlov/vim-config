require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "javascript", "python", "html", "help", "vim", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
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
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["iq"] = "@call.inner",
        ["aq"] = "@call.outer",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["aa"] = "@attribute.outer",
        ["ia"] = "@attribute.inner",
        --["ah"] = "@assignment.outer",
        --["lh"] = "@assignment.lhs",
        --["rh"] = "@assignment.rhs",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v',
        ['@function.outer'] = 'V',
        ['@class.outer'] = 'V',
      },
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
        ["]a"] = "@attribute.outer",
        ["]p"] = "@parameter.outer",
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
      },
      goto_next_end = {
        ["]F"] = "@function.inner",
        ["]C"] = "@class.inner",
        ["]B"] = "@block.inner",
        ["]A"] = "@attribute.inner",
        ["]P"] = "@parameter.inner",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[b"] = "@block.outer",
        ["[a"] = "@attribute.outer",
        ["[p"] = "@parameter.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.inner",
        ["[C"] = "@class.inner",
        ["[B"] = "@block.inner",
        ["[A"] = "@attribute.inner",
        ["[P"] = "@parameter.inner",
      },
    },
  },
}
local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.jshtml = "htmldjango"
