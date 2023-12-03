local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })
vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			print("Attaching to " .. client.name .. "on bufnr" .. bufnr)
			-- you can also put keymaps in here
		end,
		settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {},
		},
	},
	-- DAP configuration
	dap = {},
}
