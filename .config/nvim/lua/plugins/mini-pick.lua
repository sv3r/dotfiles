vim.pack.add({ 'https://github.com/echasnovski/mini.pick', 'https://github.com/echasnovski/mini.icons' })

local minipick = require('mini.pick')

require('mini.icons').setup()
minipick.setup()

vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep<CR>')
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')

vim.ui.select = minipick.ui_select
