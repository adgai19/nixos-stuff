vim.lsp.set_log_level(vim.log.levels.DEBUG)
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup_servers({
	"ansiblels",
	"clangd",
	"eslint",
	"rust_analyzer",
	"cssls",
	"dockerls",
	"gopls",
	"html",
	"hls",
	"jedi_language_server",
	"nil_ls",
	"rnix",
	"vimls",
	"vuels",
	"yamlls",
	"terraformls",
	"terraform_lsp",
})

-- lspcontainer servers with no special options

lsp.preset("recommended")
lsp.nvim_workspace()
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lsp.setup()
