return {
  -- Commenting (treesitter-aware — handles Vue sections correctly)
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  -- Context-aware comment strings (Vue, JSX, etc.)
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },

  -- Surround (sa/sd/sr — add/delete/replace)
  {
    "echasnovski/mini.surround",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- Use classic vim-surround-style keymaps
      mappings = {
        add = "gsa",
        delete = "gsd",
        replace = "gsr",
        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
      },
    },
  },

  -- Auto-pairs
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Alignment (replaces Tabular)
  {
    "echasnovski/mini.align",
    keys = {
      { "<leader>a", mode = { "n", "v" }, desc = "Align" },
    },
    opts = {
      mappings = {
        start = "<leader>a",
        start_with_preview = "<leader>A",
      },
    },
  },

  -- Enhanced motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    },
  },

  -- Abolish (keep — still useful for case-coercion and smart substitution)
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },
}
