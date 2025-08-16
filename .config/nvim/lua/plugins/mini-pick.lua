vim.pack.add({ 'https://github.com/echasnovski/mini.pick', 'https://github.com/echasnovski/mini.icons' })
require("mini.icons").setup()
require("mini.pick").setup()

vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep<CR>')
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')
