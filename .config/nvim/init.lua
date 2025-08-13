-- Based on: https://github.com/radleylewis/nvim-lite/tree/master

-- Packages
vim.pack.add({
	{src = "https://github.com/bluz71/vim-moonfly-colors"}
})

-- Theme
vim.cmd.colorscheme("moonfly")
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

-- Basic
vim.opt.number = true                               -- Line numbers
vim.opt.relativenumber = true                       -- Relative line numbers
vim.opt.cursorline = true                           -- Highlight current line
vim.opt.wrap = false                                -- Don't wrap lines
vim.opt.scrolloff = 10                              -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8                           -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 4                                 -- Tab width
vim.opt.shiftwidth = 4                              -- Indent width
vim.opt.softtabstop = 4                             -- Soft tab stop
vim.opt.expandtab = true                            -- Use spaces instead of tabs
vim.opt.smartindent = true                          -- Smart auto-indenting
vim.opt.autoindent = true                           -- Copy indent form current line

-- Search
vim.opt.ignorecase = true                           -- Case insensitive search
vim.opt.smartcase = true                            -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                            -- Don't highlight search results
vim.opt.incsearch = true                            -- Show matches as you type

-- Visual
vim.opt.termguicolors = true                        -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                          -- Always show sign column
vim.opt.colorcolumn = "100"                         -- Show column at 100 characters
vim.opt.showmatch = true                            -- Highlight matching brackets
vim.opt.matchtime = 2                               -- How long to show matching bracket
vim.opt.cmdheight = 1                               -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"   -- Completion options
vim.opt.showmode = false                            -- Don't show mode in command line
vim.opt.pumheight = 10                              -- Popup menu height
vim.opt.pumblend = 10                               -- Popup menu transparency
vim.opt.winblend = 0                                -- Floating window transparency
vim.opt.conceallevel = 0                            -- Don't hide markup
vim.opt.concealcursor = ""                          -- Don't hide cursor line markup
vim.opt.lazyredraw = true                           -- Don't redraw during macros
vim.opt.synmaxcol = 300                             -- Syntax highlighting limit

-- File
vim.opt.backup = false                              -- Don't create backup files
vim.opt.writebackup = false                         -- Don't create backup before writing
vim.opt.swapfile = false                            -- Don't create swap files
vim.opt.undofile = true                             -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir/")  -- Undo directory
vim.opt.updatetime = 300                            -- Faster completion
vim.opt.timeoutlen = 500                            -- Key timeout duration
vim.opt.ttimeoutlen = 0                             -- Key code timeout
vim.opt.autoread = true                             -- Auto reload files changed outside vim
vim.opt.autowrite = false                           -- Don't auto save

-- Behaviour
vim.opt.hidden = true                               -- Allow hidden buffers
vim.opt.errorbells = false                          -- No error bells
vim.opt.backspace = "indent,eol,start"              -- Better backspace behaviour
vim.opt.autochdir = false                           -- Don't auto change directory
vim.opt.iskeyword:append("-")                       -- Treat dash as part of word
vim.opt.path:append("**")                           -- Include subdirectories in search
vim.opt.selection = "exclusive"                     -- Selection behaviour
vim.opt.mouse = "a"                                 -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")             -- Use system clipboard
vim.opt.modifiable = true                           -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                          -- Set encoding

-- Cursor
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings
vim.opt.foldmethod = "expr"                        -- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"    -- Use treesitter for folding
vim.opt.foldlevel = 99                             -- Start with all folds open

-- Split behaviour
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Y to EOL
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line"})

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)"})

-- Better paste behaviour
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rl", ":so $MYVIMRC<CR>", { desc = "Reload config" })
