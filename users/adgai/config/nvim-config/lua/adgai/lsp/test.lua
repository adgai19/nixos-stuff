function RenameWithQuickfix()
	local position_params = vim.lsp.util.make_position_params()
	local new_name = vim.fn.input("New Name > ")

	position_params.newName = new_name

	vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, method, result, ...)
		-- You can uncomment this to see what the result looks like.
		if false then
			print(vim.inspect(result))
		end
		vim.lsp.handlers["textDocument/rename"](err, method, result, ...)

		local entries = {}
		if result.changes then
			for uri, edits in pairs(result.changes) do
				local bufnr = vim.uri_to_bufnr(uri)

				for _, edit in ipairs(edits) do
					local start_line = edit.range.start.line + 1
					local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

					table.insert(entries, {
						bufnr = bufnr,
						lnum = start_line,
						col = edit.range.start.character + 1,
						text = line,
					})
				end
			end
		end

		vim.fn.setqflist(entries, "r")
	end)
end

return { rn = RenameWithQuickfix }
