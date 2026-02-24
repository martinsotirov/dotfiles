return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "vue",
          "php",
          "go",
          "rust",
          "terraform",
          "dart",
          "fish",
          "html",
          "css",
          "lua",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "bash",
          "vim",
          "vimdoc",
          "twig",
          "regex",
          "toml",
          "dockerfile",
        },
      })

      -- Treesitter-based highlighting and indent are enabled by default in Neovim 0.11+
      -- via vim.treesitter. No additional config needed.
    end,
  },
}
