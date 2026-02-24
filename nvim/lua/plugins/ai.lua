return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "InsertEnter",
    opts = {
      provider = "claude",
      provider_options = {
        claude = {
          model = "claude-sonnet-4-20250514",
          max_tokens = 512,
          -- API key read from ANTHROPIC_API_KEY env var by default
        },
      },
      -- Virtual text completion (ghost text style)
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          accept = "<A-a>",
          accept_line = "<A-l>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
    },
  },
}
