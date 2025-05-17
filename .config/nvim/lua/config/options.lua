vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Who even invented wrapping?
vim.opt.wrap = false

-- Splitting for non-psychopaths
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"
vim.opt.guicursor = ""

vim.o.hlsearch = false
vim.opt.inccommand = "split"
vim.opt.ignorecase = true

vim.opt.termguicolors = true

-- Set up diagnostics
vim.diagnostic.config({
    virtual_lines = true,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.cmd.startinsert()

        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0, noremap = true })
    end,
})

vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("K")
    vim.api.nvim_win_set_height(0, 15)
end)
