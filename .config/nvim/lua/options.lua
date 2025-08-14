local undodir = vim.fn.expand("~/.vim/undodir")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Scrolloff
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.guicursor = {
    "n-v-c:block",
    "i-ci-ve:block",
    "r-cr:hor20",
    "o:hor50"
}

-- Brackets
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Files
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir

-- Splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Behaviour
vim.opt.diffopt:append("linematch:60")
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- Performance
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Blasphemies 
vim.opt.mouse = "a"

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    group = augroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- Create undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
