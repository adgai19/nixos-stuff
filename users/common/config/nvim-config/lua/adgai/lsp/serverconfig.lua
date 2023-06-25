local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set

	bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
	bind("n", "<leader><leader><leader>", vim.lsp.buf.code_action, opts)
end)

lsp.setup_servers({
	"ansiblels",
	"astro",
	"bufls",
	"clangd",
	"cssls",
	"dockerls",
	"eslint",
	"gopls",
	"hls",
	"html",
	"jedi_language_server",
	"nil_ls",
	"rnix",
	"rust_analyzer",
	"tailwindcss",
	"terraform_lsp",
	"terraformls",
	"vimls",
	"vuels",
	"yamlls",
})

local lspconfig = require("lspconfig")
lsp.configure("clangd", {
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	-- cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
})

lsp.setup_nvim_cmp({
	sources = {
		{ name = "path" },
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
})
lsp.nvim_workspace()
lsp.setup()
