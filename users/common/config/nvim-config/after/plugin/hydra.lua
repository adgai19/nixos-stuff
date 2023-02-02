local Hydra = require("hydra")
Hydra({
	name = "window move",
	mode = "n",
	config = {
		on_enter = function()
			vim.notify("inside hydra")
		end,
		on_exit = function()
			vim.notify("out of hydra")
		end,
	},
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
		{ "s", "<cmd>sp<cr>", {} },
		{ "v", "<cmd>vsp<cr>", {} },
	},
})
