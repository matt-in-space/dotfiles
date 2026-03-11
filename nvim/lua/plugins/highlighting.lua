return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local parsers = require("nvim-treesitter.parsers")
		if not parsers.ft_to_lang then
			parsers.ft_to_lang = vim.treesitter.language.get_lang
		end

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
