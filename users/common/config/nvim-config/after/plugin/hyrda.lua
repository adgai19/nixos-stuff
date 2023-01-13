local Hydra = require("hydra")
print('inside hydra')
Hydra({
	name = "window move",
	mode = "n",
	body = "<c-w>",
	heads = {
		{ "h", "<c-w>h", {} },
		{ "j", "<c-w>j", {} },
		{ "k", "<c-w>k", {} },
		{ "l", "<c-w>l", {} },
		{ "<", "<c-w><", {} },
		{ ">", "<c-w>>", {} },
		{ "u", "<c-w>+", {} },
		{ "d", "<c-w>-", {} },
	},
})
