local map = vim.keymap.set

-- Format file
map('n', '<leader>mp', vim.lsp.buf.format)

-- Better yanking
map('n', 'Y', 'y$', { desc = 'Yank to end of line' })
map('x', '<leader>p', '"_dP', { desc = 'Paste without yanking' })
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

-- Navigate document centered
map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Navigate buffers
map('n', '<leader>bb', '<C-^>', { desc = 'Switch to alternate buffer' })
map('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Window creation
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })
map('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Move lines
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Indent
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Join lines whilst keeping cursor position
map('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Source current file / execute lua code
map('n', '<leader>xx', ':source %<CR>', { desc = 'Source current file' })
map('n', '<leader>x', ':.lua<CR>', { desc = 'Lua: execute current line' })
map('v', '<leader>x', ':lua<CR>', { desc = 'Lua: execute current selection' })

-- LSP
map('n', 'K', vim.lsp.buf.hover, {})
map('n', '<leader>gd', vim.lsp.buf.definition, {})
map('n', '<leader>gr', vim.lsp.buf.references, {})
map('n', '<leader>gf', vim.lsp.buf.format, {})
map('n', '<leader>ca', vim.lsp.buf.code_action, {})
map('n', '<leader>rn', vim.lsp.buf.rename, {})
