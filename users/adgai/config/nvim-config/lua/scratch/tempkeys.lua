vim.api.nvim_set_keymap(
	"v",
	"<Leader>re",
	[[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>rf",
	[[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>rt",
	[[ <Cmd>lua require("plugins.refactoring").refactors()<CR>]],
	{ noremap = true, silent = true, expr = false }
)
