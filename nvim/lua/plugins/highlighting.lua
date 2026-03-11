return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true,
			sync_install = false,
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"eex",
				"elixir",
				"gitcommit",
				"gitignore",
				"heex",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"ruby",
				"rust",
				"scss",
				"sql",
				"typescript",
				"yaml",
			},
		})
	end,
}
