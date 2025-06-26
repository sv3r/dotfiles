-- UI
vim.opt.number = true -- Make line numbers default (default: false)
vim.opt.relativenumber = true -- Set relative numbered lines (default: false)
vim.opt.cursorline = false -- Highlight the current line (default: false)
vim.opt.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default (default: "auto")
vim.opt.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
vim.opt.wrap = false -- Display lines as one long line (default: true)
vim.opt.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.opt.mouse = "a" -- Enable mouse mode (default: "")
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
vim.opt.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
vim.opt.pumheight = 10 -- Pop up menu height (default: 0)
vim.opt.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)

-- Navigation
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.opt.smartcase = true -- Smart case (default: false)
vim.opt.hlsearch = false -- Set highlight on search (default: true)
vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.opt.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
vim.opt.whichwrap = "bs<>[]hl" -- Which "horizontal" keys are allowed to travel to prev/next line (default: "b,s")

-- Indentation
vim.opt.autoindent = true -- Copy indent from current line when starting new one (default: true)
vim.opt.smartindent = true -- Make indenting smarter again (default: false)
vim.opt.expandtab = true -- Convert tabs to spaces (default: false)
vim.opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.opt.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)

-- System
vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim. (default: "")
vim.opt.fileencoding = "utf-8" -- The encoding written to a file (default: "utf-8")
vim.opt.swapfile = false -- Creates a swapfile (default: true)
vim.opt.backup = false -- Creates a backup file (default: false)
vim.opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.opt.undofile = true -- Save undo history (default: false)
vim.g.have_nerd_font = true -- Manually enable nerd-font usage (default: false)

-- Layout
vim.opt.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
vim.opt.splitright = true -- Force all vertical splits to go to the right of current window (default: false)

-- Performance
vim.opt.updatetime = 250 -- Decrease update time (default: 4000)
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)

-- Completion
vim.opt.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience (default: "menu,preview")
vim.opt.shortmess:append("c") -- Don't give |ins-completion-menu| messages (default: does not include "c")
vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches (default: does not include "-")
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically for auto-wrapping comments using "textwidth", hitting <Enter> in insert mode, or hitting "o" or "O" in normal mode. (default: "croql")

-- Advanced
vim.opt.showtabline = 2 -- Always show tabs (default: 1)
vim.opt.backspace = "indent,eol,start" -- Allow backspace on (default: "indent,eol,start")
vim.opt.breakindent = true -- Enable break indent (default: false)
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
