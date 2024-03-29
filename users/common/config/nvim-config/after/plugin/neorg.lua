vim.print("loading neorg")
require("neorg").setup({
	---- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
			},
		},
	},
	["core.concealer"] = {}, -- Adds pretty icons to your documents
	["core.export"] = {}, -- Export"]
})
