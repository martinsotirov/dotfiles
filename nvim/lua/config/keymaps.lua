local map = vim.keymap.set

-- Escape insert mode with jk
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "<Esc>", "<Nop>")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Switch to alternate buffer
map("n", "<leader>`", "<cmd>e #<CR>", { desc = "Switch to other buffer" })

-- Edit config
map("n", "<leader>ev", "<cmd>vsplit $MYVIMRC<CR>", { desc = "Edit nvim config" })

-- Expand %% to current file's directory in command mode
map("c", "%%", "getcmdtype() == ':' ? expand('%:h') .. '/' : '%%'", { expr = true })

-- Tab indentation
map("n", "<Tab>", ">>_", { desc = "Indent line" })
map("n", "<S-Tab>", "<<_", { desc = "Dedent line" })
map("i", "<S-Tab>", "<C-D>", { desc = "Dedent in insert" })
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Dedent selection" })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Auto-indent on paste
map("n", "p", "p=`]", { desc = "Paste and indent" })

-- fzf-lua keybindings (defined here, actual commands in plugins/picker.lua)
-- These are set up in picker.lua after the plugin loads

-- Grep word under cursor (set up in picker.lua)
-- gr mapped in picker.lua
