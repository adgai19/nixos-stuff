require("lint").linters_by_ft = {
	javascript = { "jshint", "eslint" },
}

local linters = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { command = "lua require('lint').try_lint()", group = linters })
