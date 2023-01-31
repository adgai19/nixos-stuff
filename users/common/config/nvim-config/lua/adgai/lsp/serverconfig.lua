vim.lsp.set_log_level(vim.log.levels.DEBUG)
local lspconfig = require("lspconfig")
local lspcontainers = require("lspcontainers")
local lsp = require("lsp-zero")
lsp.preset("recommended")

local on_attach = require("adgai.lsp.on_attach").on_attach
local make_client_capabilities = require("adgai.lsp.on_attach").make_client_capabilities

lsp.setup_servers({
	"ansiblels",
	"clangd",
	"eslint",
	"rust_analyzer",
	"cssls",
	"dockerls",
	"gopls",
	"html",
	"jedi_language_server",
	"nil_ls",
	"rnix",
	"vimls",
	"vuels",
	"yamlls",
})

-- lspcontainer servers with no special options
local serverContainerSetup = function(server, opts)
	opts = opts or {}
	opts.on_attach = on_attach
	opts.capabilities = make_client_capabilities()
	opts.cmd = lspcontainers.command(server)
	lspconfig[server].setup(opts)
end
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

-- other servers
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- local library = vim.api.nvim_get_runtime_file("", true)
-- table.insert(library, "/usr/share/awesome/lib")
-- local opts = {
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = "LuaJIT",
-- 				path = runtime_path,
-- 			},
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = library,
-- 			},
-- 			telemetry = { enable = false },
-- 		},
-- 	},
-- }
-- serverContainerSetup("sumneko_lua", opts)

-- local jsonOpts = {
-- 	before_init = function(params)
-- 		params.processId = vim.NIL
-- 	end,
-- 	filetypes = { "json", "jsonc" },
-- 	settings = {
-- 		json = {
-- 			-- http = {
-- 			-- 	proxy = "",
-- 			-- 	proxyStrictSSL = false,
-- 			-- 	proxyAuthorization = false,
-- 			-- 	proxySupport = "off",
-- 			-- },
--
-- 			-- schemas = require("schemastore").json.schemas(),
-- 		},
-- 	},
-- }
-- serverContainerSetup("jsonls", jsonOpts)
--

require("lspconfig").terraformls.setup({
	cmd = require("lspcontainers").command("terraformls"),
	filetypes = { "hcl", "tf", "terraform", "tfvars" },
	on_attach = on_attach,
	capabilities = make_client_capabilities(),
})

require("lspconfig").terraform_lsp.setup({
	filetypes = { "hcl", "tf", "terraform", "tfvars" },
	on_attach = on_attach,
	capabilities = make_client_capabilities(),
})
