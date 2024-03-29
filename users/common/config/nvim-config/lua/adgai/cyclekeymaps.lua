local nnoremap = require("adgai.keymaps.helpers").nnoremap

local M = {}
M.mode = "normal"
M.setMode = function(mode)
	M.mode = mode
end
M.change_mode_qf = function()
	if M.mode == "normal" then
		nnoremap("n", "<cmd>cnext<cr>")
		nnoremap("e", "<cmd>cprev<cr>")
		M.mode = "qf"
		print("current mode", M.mode)
	elseif M.mode == "qf" then
		vim.keymap.del("n", "n")
		vim.keymap.del("n", "e")
		M.mode = "normal"
		print("current mode", M.mode)
	end
end

M.change_mode_json = function()
	if M.mode == "normal" then
		nnoremap("n", require("jvim").to_parent)
		nnoremap("e", require("jvim").descend)
		nnoremap("k", require("jvim").prev_sibling)
		nnoremap("l", require("jvim").next_sibling)
		M.mode = "json_traverse"
		print("current mode", M.mode)
	elseif M.mode == "json_traverse" then
		vim.keymap.del("n", "j")
		vim.keymap.del("e", "k")
		vim.keymap.del("k", "e")
		vim.keymap.del("l", "l")
		M.mode = "normal"
		print("current mode", M.mode)
	elseif M.mode == "ll" then
		nnoremap("n", "<cmd>nnext<cr>")
		nnoremap("e", "<cmd>nprev<cr>")
		M.mode = "normal"
	end
end
nnoremap("<C-b>b", M.change_mode_qf)
nnoremap("<C-b>n", M.change_mode_json)
return M
