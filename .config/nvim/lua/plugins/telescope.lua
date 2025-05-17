return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("fzf")

            telescope.setup {
                defaults = require("telescope.themes").get_ivy {
                    file_ignore_patterns = {
                        "%.o",
                        "%.d"
                    }
                }
            }

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "Telescope find files in current directory" })
            vim.keymap.set("n", "<leader>en", function() builtin.find_files { cwd = vim.fn.stdpath("config") } end, { desc = "Telescope find files in neovim config directory" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        end,
    }
}
