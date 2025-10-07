vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
    'https://github.com/rafamadriz/friendly-snippets'
})

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    completion = { documentation = { auto_show = true } },
    signature = { enabled = true }
})
