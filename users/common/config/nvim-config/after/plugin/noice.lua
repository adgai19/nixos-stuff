require("noice").setup({
	presets = {
		inc_rename = true,
		command_palette = true,
		long_message_to_split = true, -- long messages will be sent to a split
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
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
