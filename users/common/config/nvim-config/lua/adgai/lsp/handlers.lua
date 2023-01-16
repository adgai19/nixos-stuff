vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = true,
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
	severity_sort = true,
})

local signs = {
	Error = " ",
	Warning = " ",
	Hint = " ",
	Information = " ",
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		source = "always", -- Or "if_many"
	},
})
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.api.nvim_command("highlight! link LspDiagnosticsError DiffDelete")
vim.api.nvim_command("highlight! link LspDiagnosticsWarning DiffChange")
vim.api.nvim_command("highlight! link LspDiagnosticsHint NonText")
