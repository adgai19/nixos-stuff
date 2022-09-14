-- vim.notify_once("neorg loaded")
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					nvim = "~/.config/nvim",
					home = "~/notes/home",
				},
			},
		},

		["core.gtd.base"] = {
			config = {
				workspaces = {
					nvim = "~/.config/nvim",
				},
			},
		},
	},
})
