local M = {}
function M.addKeymap(table)
	-- print(vim.inspect(table))
	for m, item in pairs(table) do
		print(m)
		-- print(vim.inspect(item))
		for _, keymaps in ipairs(item) do
			print(vim.inspect(keymaps))
			local mode, lhs, rhs, options = keymaps[1], keymaps[2], keymaps[3], keymaps[4]
			print(mode, lhs, rhs, options)
		end
	end
end
return M
