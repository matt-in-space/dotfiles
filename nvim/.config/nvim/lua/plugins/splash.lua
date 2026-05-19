return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button(
				"f",
				"  Find file",
				":cd $HOME | silent Telescope find_files hidden=true no_ignore=true <CR>"
			),
			dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button("c", "  Settings", ":e $HOME/.config/nvim/init.lua<CR>"),
			dashboard.button("p", "  Projects", ":e $HOME/dev <CR>"),
			dashboard.button("d", "󱗼  Dotfiles", ":e $HOME/.dotfiles <CR>"),
			dashboard.button("q", "󰿅  Quit", "<cmd>qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
