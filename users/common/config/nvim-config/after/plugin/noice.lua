require("noice").setup({
	presets = {
		inc_rename = true,
		command_palette = true,
		long_message_to_split = true, -- long messages will be sent to a split
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
	},
})
