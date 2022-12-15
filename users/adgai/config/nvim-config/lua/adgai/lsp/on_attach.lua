local on_attach = function(client, bufnr)
	-- require("lsp_signature").on_attach() -- Note: add in lsp client on-attach

local nnoremap = require("adgai.keymaps.helpers").nnoremap
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts={buffer=0,noremap=true}
	nnoremap("gD", vim.lsp.buf.declaration,opts)
	nnoremap("gd", vim.lsp.buf.definition,opts)
	nnoremap( "K", vim.diagnostic.open_float,opts)
	nnoremap("gi", vim.lsp.buf.implementation,opts)
	--
	nnoremap( "<C-k>", vim.lsp.buf.signature_help,opts)
	nnoremap( "<space>wa", vim.lsp.buf.add_workspace_folder,opts)
	nnoremap( "<space>wr", vim.lsp.buf.remove_workspace_folder,opts)
	nnoremap( "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" ,opts)
	nnoremap( "<space>D", vim.lsp.buf.type_definition,opts)
	nnoremap("<A-CR>", vim.lsp.buf.code_action,opts)
	nnoremap( "<space>rn", vim.lsp.buf.rename,opts)
	nnoremap( "<space>ca", vim.lsp.buf.code_action,opts)
	nnoremap( "gr", vim.lsp.buf.references,opts)
	nnoremap( "[d", vim.diagnostic.goto_prev,opts)
	nnoremap( "]d", vim.diagnostic.goto_next,opts)
	nnoremap( "<space>q", vim.diagnostic.setloclist,opts)
	nnoremap( "<space>bf", vim.lsp.buf.format,opts)
end

local make_client_capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.offsetEncoding = { "utf-16" }
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { "documentation", "detail", "additionalTextEdits" },
	}
	return capabilities
end
return { on_attach = on_attach, make_client_capabilities = make_client_capabilities }
