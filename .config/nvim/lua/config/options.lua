-- Lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent = true

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

-- Preview substitutions
vim.opt.inccommand = 'split'

-- Visual
vim.opt.winborder = 'rounded'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.guicursor = {
    'n-v-c:block',
    'i-ci-ve:block',
    'r-cr:hor20',
    'o:hor50'
}

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Brackets
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Files
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = Undodir

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Behaviour
vim.opt.diffopt:append('linematch:60')
vim.opt.clipboard:append('unnamedplus')
vim.opt.iskeyword:append('-')
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- Performance
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Blasphemies
vim.opt.mouse = 'a'
