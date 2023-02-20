local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

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

lsp.nvim_workspace()
lsp.setup()
