vim.pack.add({ 'https://github.com/bluz71/vim-moonfly-colors' })

local bg_transparent = true
vim.g.moonflyTransparent = bg_transparent

local reload_moonfly = function()
    package.loaded['moonfly'] = nil
    require('moonfly').style()
end

reload_moonfly()

local toggle_transparency = function()
    bg_transparent = not bg_transparent
    vim.g.moonflyTransparent = bg_transparent
    reload_moonfly()
end

vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

vim.cmd('colorscheme moonfly')
