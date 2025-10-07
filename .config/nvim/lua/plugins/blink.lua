vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
    'https://github.com/rafamadriz/friendly-snippets'
})

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
        nerd_font_variant = 'mono',
    },
    completion = {
        documentation = { auto_show = false },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = 'lua' },
})
