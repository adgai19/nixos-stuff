local M = {}
M.init = function()
	require("adgai.dap")
	require("adgai.cyclekeymaps")
	require("adgai.input")
	require("adgai.runner")
	require("adgai.lsp")
	require("adgai.ftspecific.yaml-ansible")
	require("adgai.general")
	require("adgai.autocmds")
	require("adgai.keymaps")
	require("adgai.base64enc")
end
return M
