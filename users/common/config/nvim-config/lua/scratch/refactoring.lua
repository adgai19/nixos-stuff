local refactor = require("refactoring")
refactor.setup({})
print(vim.inspect(refactor.get_refactors()))
local function ui_map()
	-- code
	vim.ui.select(refactor.get_refactors(), {
		prompt = "refactoring",
	}, function(item)
		print(item)
		refactor.refactor(item)
	end)
end

_G.Refactor_remaps = {
	ui_map = ui_map,
}
vim.api.nvim_set_keymap("v", "<leader>rf", "<cmd>lua Refactor_remaps.ui_map()<CR>", { silent = true })
