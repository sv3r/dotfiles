-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Save file
vim.keymap.set("n", "<C-s>", "<cmd> w<CR>", opts)

-- Save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", opts)

-- Quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts)

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", opts) -- Close buffer
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", opts) -- New buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- Split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- Split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- Make split windows equal width & height
vim.keymap.set("n", "<leader>xs", "<cmd>close<CR>", opts) -- Close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts) -- Open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts) -- Close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts) --  Go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts) --  Go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
