return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	opts = {
		-- A list of parser names, or "all" (the listed parsers MUST always be installed)
		ensure_installed = {
			-- Recommended parsers
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			-- Other parsers
			"python",
			"javascript",
			"typescript",
			"regex",
			"sql",
			"dockerfile",
			"toml",
			"json",
			"go",
			"gitignore",
			"yaml",
			"make",
			"cmake",
			"bash",
			"tsx",
			"css",
			"html",
		},
		sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
		auto_install = true, -- Autoinstall languages that are not installed
		highlight = {
			enable = true,
			-- To disable slow treesitter highlight for large files
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
	},
}
