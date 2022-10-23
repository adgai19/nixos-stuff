-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('lsp.code_action_utils').code_action_listener()]])

local function buf_set_keymap(...)
	vim.api.nvim_buf_set_keymap(0, ...)
end

-- Mappings.
local opts = { noremap = true, silent = true }
-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>", opts)
buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
buf_set_keymap("n", "<space>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- require("plugins.cmp-setup")
local config = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

config.cmd = {
	"java-lsp.sh",
	"/home/adgai/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
}
config.root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" })
require("jdtls").start_or_attach(config)
local mapper = require("tools.utils")
mapper.nnoremap("<A-CR>", "<cmd>lua require('jdtls').code_action()<CR>")
mapper.vnoremap("<A-CR>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>")
mapper.nnoremap("<leader>r <Cmd>lua", "require('jdtls').code_action(false, 'refactor')<CR>")
-- mapper.nnoremap("<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
mapper.nnoremap("crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
mapper.vnoremap("crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
mapper.nnoremap("crc", "<Cmd>lua require('jdtls').extract_constant()<CR>")
mapper.vnoremap("crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
mapper.vnoremap("crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
mapper.nnoremap("<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
mapper.nnoremap("<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
