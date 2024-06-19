local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set

	bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
	bind("n", "<leader><leader><leader>", vim.lsp.buf.code_action, opts)
	lsp.default_keymaps({ to_bufnr = bufnr })
end)

lsp.setup_servers({
	"ansiblels",
	"astro",
	"bufls",
	"clangd",
	"cssls",
	"dockerls",
	"eslint",
	"hls",
	"html",
	"jedi_language_server",
	"lua_ls",
	"nil_ls",
	"postgres_lsp",
	"nixd",
	"pylsp",
	"pyright",
	"tailwindcss",
	"terraform_lsp",
	"terraformls",
	"vimls",
	"vuels",
})

lsp.configure("clangd", {
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
-- An example nvim-lspconfig capabilities setting
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
capabilities.workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = true,
    },
}

require("lspconfig").markdown_oxide.setup({
    capabilities = capabilities, -- again, ensure that capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
})

require("lspconfig").yamlls.setup({
	filetypes = { "yaml", "yaml.docker-compose", "yml" },
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
			},
			schemas = {
				["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
})

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "copilot" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 5 },
	},
})
--
-- Fix lua lsp
-- {
--   "runtime.version": "LuaJIT",
--   "runtime.path": [
--     "lua/?.lua",
--     "lua/?/init.lua"
--   ],
--   "diagnostics.globals": ["vim"],
--   "workspace.checkThirdParty": false,
--   "workspace.library": [
--     "$VIMRUNTIME",
--     "./lua"
--   ]
-- }
--
