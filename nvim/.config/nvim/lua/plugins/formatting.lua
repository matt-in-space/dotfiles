return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				css = { "prettier" },
				lua = { "stylua" },
				elixir = { "mix" },
				eelixir = { "mix" },
				heex = { "mix" },
				svelte = { "prettier" },
				yml = { "yamlfmt" },
				yaml = { "yamlfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = { timeout_ms = 3000 },
		}
	},
	{ "tpope/vim-surround" }
}
