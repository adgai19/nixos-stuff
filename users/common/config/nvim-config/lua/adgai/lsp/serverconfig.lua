local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  bind('n', '<leader>rn', vim.lsp.buf.rename, opts)
  bind('n','<leader><leader><leader>',vim.lsp.buf.code_action,opts)
end)

lsp.setup_servers({
	"ansiblels",
	"astro",
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

lsp.setup_nvim_cmp({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "codeium", keyword_length = 2 },
	},
})
lsp.nvim_workspace()
lsp.setup()
