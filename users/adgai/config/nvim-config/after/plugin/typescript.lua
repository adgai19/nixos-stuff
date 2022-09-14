local lspconfig = require("lspconfig")
local on_attach = require("adgai.lsp.on_attach").on_attach

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	disable_formatting = false, -- disable tsserver's formatting capabilities
	debug = false, -- enable debug logging for commands
	server = { -- pass options to lspconfig's setup method
		root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", "lerna.json", ".git"),
		settings = { documentFormatting = false },
		on_attach = function(clients, bufnr)
			-- no default maps, so you may want to define some here
			local opts = { silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
			on_attach(clients, bufnr)
		end,
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = require("lspcontainers").command("tsserver"),
	},
})
