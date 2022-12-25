-- local ansible_goto_role_paths={'./roles','../_common/roles'}
vim.cmd([[set path+=roles/]])
local FindAnsibleRoleUnderCursor = function()
	local role_paths = "./roles/"
	local role_path = vim.fn.expand("<cword>")
	local task_main = role_path .. "/tasks/main.yml"
	local role_file = vim.fn.findfile(role_paths .. task_main)
	if role_file == "" then
		print("nothing found, creating new file")
		vim.cmd("!mkdir -p " .. role_paths .. role_path .. "/tasks")
		vim.cmd("!touch " .. role_paths .. task_main)
		vim.cmd(":e" .. role_paths .. task_main)
	else
		vim.cmd(":e" .. role_file)
	end
end

local nnoremap = require("adgai.keymaps.helpers").nnoremap
local augroup = vim.api.nvim_create_augroup("ansible", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml.ansible",
	callback = function()
		nnoremap("<leader>gf", FindAnsibleRoleUnderCursor)
	end,
	group = augroup,
})
