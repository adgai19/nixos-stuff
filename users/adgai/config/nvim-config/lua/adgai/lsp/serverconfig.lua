-- vim.lsp.set_log_level(vim.log.levels.DEBUG)
local lspconfig = require("lspconfig")
local lspcontainers = require("lspcontainers")

local on_attach = require("adgai.lsp.on_attach").on_attach
local make_client_capabilities = require("adgai.lsp.on_attach").make_client_capabilities

-- normal lsp servers
local serverSetup = function(server)
	lspconfig[server].setup({ on_attach = on_attach, capabilities = make_client_capabilities() })
end

local serverlist = {
	"ansiblels",
	"vimls",
	"ccls",
	"rnix",
	"cssls",
	"emmet_ls",
	"jedi_language_server",
	-- "nil_ls",
	"eslint",
	"gopls",
}
for _, server in ipairs(serverlist) do
	serverSetup(server)
end

-- lspcontainer servers with no special options
local serverContainerSetup = function(server, opts)
	opts = opts or {}
	opts.on_attach = on_attach
	opts.capabilities = make_client_capabilities()
	opts.cmd = lspcontainers.command(server)
	lspconfig[server].setup(opts)
end

local normalServerContainerList = {
	"clangd",
	-- "gopls",
	"pylsp",
	"rust_analyzer",
}
for _, server in ipairs(normalServerContainerList) do
	serverContainerSetup(server)
end

-- lspcontainer servers with beforeInit
local beforeInitServers = { "html", "yamlls", "dockerls", "vuels", "tsserver" }
local beforeInitOptions = {
	before_init = function(params)
		params.processId = vim.NIL
	end,
}
for _, server in ipairs(beforeInitServers) do
	serverContainerSetup(server, beforeInitOptions)
end

-- other servers
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local library = vim.api.nvim_get_runtime_file("", true)
table.insert(library, "/usr/share/awesome/lib")
local opts = {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = library,
			},
			telemetry = { enable = false },
		},
	},
}
serverContainerSetup("sumneko_lua", opts)

local jsonOpts = {
	before_init = function(params)
		params.processId = vim.NIL
	end,
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- http = {
			-- 	proxy = "",
			-- 	proxyStrictSSL = false,
			-- 	proxyAuthorization = false,
			-- 	proxySupport = "off",
			-- },

			-- schemas = require("schemastore").json.schemas(),
		},
	},
}
serverContainerSetup("jsonls", jsonOpts)

-- lspconfig.gopls.setup({
-- 	cmd = require("lspcontainers").command("ftassigopls", {
-- 		image = "lspcontainers/gopls",
-- 		network = "bridge",
-- 		cmd_builder = function(runtime, workdir, image, network)
-- 			local volume = workdir .. ":" .. workdir .. ":z"
-- 			local env = vim.api.nvim_eval("environ()")
-- 			local gopath = env.GOPATH or env.HOME .. "/go"
-- 			local gopath_volume = gopath .. ":" .. gopath .. ":z"
--
-- 			local group_handle = io.popen("id -g")
-- 			local user_handle = io.popen("id -u")
--
-- 			local group_id = string.gsub(group_handle:read("*a"), "%s+", "")
-- 			local user_id = string.gsub(user_handle:read("*a"), "%s+", "")
--
-- 			group_handle:close()
-- 			user_handle:close()
--
-- 			local user = user_id .. ":" .. group_id
--
-- 			return {
-- 				runtime,
-- 				"container",
-- 				"run",
-- 				"--interactive",
-- 				"--network=" .. network,
-- 				"--rm",
-- 				"--workdir=" .. workdir,
-- 				"--volume=" .. volume,
-- 				"--user=" .. user,
-- 				image,
-- 			}
-- 		end,
-- 	}),
-- 	on_attach = on_attach,
-- 	capabilities = make_client_capabilities(),
-- })

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
