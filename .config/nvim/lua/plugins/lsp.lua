return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.clangd.setup({capabilities = capabilities})
            lspconfig.pyright.setup({capabilities = capabilities})

            vim.keymap.set("n", "<leader>mp", vim.lsp.buf.format)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references)
            vim.keymap.set("n", "<leader>ri", vim.lsp.buf.implementation)
            vim.keymap.set("n", "<leader>O", vim.lsp.buf.document_symbol)
        end,
    }
}
