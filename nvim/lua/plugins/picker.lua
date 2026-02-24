return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
      { "<leader>o", "<cmd>FzfLua files<CR>", desc = "Find files" },
      { "<leader><space>", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<leader>r", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
      { "<leader>f", "<cmd>FzfLua grep<CR>", desc = "Grep with query" },
      { "\\", "<cmd>FzfLua grep<CR>", desc = "Grep with query" },
      { "<leader>c", "<cmd>FzfLua git_commits<CR>", desc = "Git commits" },
      { "<leader>b", "<cmd>FzfLua git_bcommits<CR>", desc = "Buffer commits" },
      { "gr", "<cmd>FzfLua grep_cword<CR>", mode = "n", desc = "Grep word under cursor" },
      { "gr", "<cmd>FzfLua grep_visual<CR>", mode = "v", desc = "Grep visual selection" },
      { "<leader>h", "<cmd>FzfLua help_tags<CR>", desc = "Help tags" },
      { "<leader>lr", "<cmd>FzfLua lsp_references<CR>", desc = "LSP references" },
      { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "LSP document symbols" },
    },
    opts = {
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = "vertical",
          vertical = "down:45%",
        },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      files = {
        fd_opts = "--type f --hidden --follow --exclude .git",
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --follow --glob '!.git/*'",
      },
      git = {
        commits = {
          cmd = "git log --graph --color=always --format='%C(yellow)%h%C(red)%d%C(reset) - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)'",
        },
      },
    },
  },
}
