require("options")
require("keymaps")

-- Packages
vim.pack.add({
	{src = "https://github.com/bluz71/vim-moonfly-colors"}
})

-- Theme
vim.cmd.colorscheme("moonfly")
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
