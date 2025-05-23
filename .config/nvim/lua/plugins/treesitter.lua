---@diagnostic disable: undefined-field, unused-local, missing-fields
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "go", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
            auto_install = false,

            highlight = {
                enable = true,

                disable = function(lang, buf)
                    local max_filesize = 100 * 1024     -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss",
                    node_incremental = "<leader>si",
                    scope_incremental = "<leader>sc",
                    node_decremental = "<leader>sd",
                }
            },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                    },

                    selection_modes = {
                        ["@parameter.outer"] = "v",     -- charwise
                        ["@function.outer"] = "V",      -- linewise
                        ["@class.outer"] = "<c-v>",     -- blockwise
                    },

                    include_surrounding_whitespace = true,
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
}
