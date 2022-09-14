local nnoremap = require("keymaps.helpers").nnoremap
nnoremap("<leader>tt", require("workbench").toggle_project_workbench)
local workbench_augroup = vim.api.nvim_create_augroup("workbench-autocmd", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		nnoremap("<leader>ta", "<Plug>WorkbenchToggleCheckbox")
	end,
	group = workbench_augroup,
})
