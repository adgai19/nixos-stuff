require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.DEBUG,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		-- nix = { require("formatter.filetypes.nix").nixpkgs_fmt },
		javascript = {},
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})
-- vim.api.nvim_create_autocmd(
-- 	"BufWritePost",
-- 	{ pattern = "*", command = "FormatWrite", group = vim.api.nvim_create_augroup("Formatter", { clear = true }) }
-- )
