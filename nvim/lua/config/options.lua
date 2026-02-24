-- Leader key (must be set before lazy.nvim)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = "a"

-- Cursor
vim.opt.cursorline = true

-- Clipboard
vim.opt.clipboard = "unnamed"

-- Buffers
vim.opt.hidden = true

-- Tabs / indentation (default: 4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.fillchars:append({ vert = "│" })
vim.opt.signcolumn = "yes"
vim.opt.showmode = false -- lualine shows mode

-- File encoding
vim.opt.fileencoding = "utf-8"

-- Swap files
vim.opt.backupdir = vim.fn.expand("~/.vim/swap")
vim.opt.directory = vim.fn.expand("~/.vim/swap")

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Scrolloff
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Update time (faster gitsigns, etc.)
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
