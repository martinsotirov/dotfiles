local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Filetype-specific indentation (2 spaces)
augroup("FileTypeIndent", { clear = true })
autocmd("FileType", {
  group = "FileTypeIndent",
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "yaml", "json", "cucumber" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Drupal filetypes → PHP
augroup("DrupalFiletypes", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
  group = "DrupalFiletypes",
  pattern = { "*.module", "*.install", "*.test", "*.inc", "*.profile", "*.theme" },
  callback = function()
    vim.bo.filetype = "php"
  end,
})

-- Custom filetype associations
augroup("CustomFiletypes", { clear = true })
autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
  group = "CustomFiletypes",
  pattern = "*.xml.dist",
  callback = function()
    vim.bo.filetype = "xml"
  end,
})
autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
  group = "CustomFiletypes",
  pattern = "*.html.tera",
  callback = function()
    vim.bo.filetype = "twig"
  end,
})

-- Restore cursor position when reopening a file
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
  group = "RestoreCursor",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 1 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight on yank
augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
  group = "HighlightYank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
