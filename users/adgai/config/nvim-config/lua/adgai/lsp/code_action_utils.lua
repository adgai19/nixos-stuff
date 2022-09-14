local M = {}

-- local lsp_util = vim.lsp.util
function M.code_action_listener()
	-- local context = { diagnostics = vim.diagnostic.get_line_diagnostics() }
	-- local params = lsp_util.make_range_params()
	-- params.context = context
	-- vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, _, result)
	-- 	-- print(vim.inspect(result.params))
	-- 	if err then
	-- 		vim.notify(err)
	-- 	end
	-- 	-- if results then
	-- 	-- 	vim.notify(result)
	-- 	-- end
	-- end)
end

return M
