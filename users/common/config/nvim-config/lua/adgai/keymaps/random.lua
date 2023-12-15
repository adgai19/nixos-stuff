local nnoremap = require("adgai.keymaps.helpers").nnoremap
local vnoremap = require("adgai.keymaps.helpers").vnoremap
local xnoremap = require("adgai.keymaps.helpers").xnoremap
local tnoremap = require("adgai.keymaps.helpers").tnoremap

nnoremap(";", ":")
nnoremap(":", ";")

-- quick quit
nnoremap("<M-q>", "<cmd>q<CR>")

-- inoremap(";;", "<esc>A;<CR>")

-- move text up and down
vnoremap("<C-S-n>", ":m '>+1<CR>gv=gv")
vnoremap("<C-s-p>", ":m '<-2<CR>gv=gv")

-- split and resize
nnoremap("<Leader>=", ":vertical resize +5<CR>")
nnoremap("<Leader>-", ":vertical resize -5<CR>")
nnoremap("<Leader>h", " :split<cr>")
nnoremap("<Leader>v", " :vsplit<cr>")

-- quick source
nnoremap("<Leader>s", " :w<cr>:so %<cr>")

nnoremap("<space>ca", "<cmd>lua require('code_action_menu').open_code_action_menu<cr>")

-- dead reg keymaps
xnoremap("<leader>p", '"_dP')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("<leader>cf", "<cmd>Explore<cr>")

nnoremap("Q", "@q")
nnoremap("J", "mzJ`z")

nnoremap("<C-up>", "<cmd>tabnext<cr>")
nnoremap("<C-down>", "<cmd>tabprevious<cr>")

vnoremap("<", " <gv")
vnoremap(">", " >gv")

tnoremap([[<Esc>]], [[<C-\><C-n>]])
nnoremap([[\]], ":Rg<space>")
nnoremap([[<leader><leader>]], ":nohl<cr>")
nnoremap([[<Esc>]], [[<cmd>w<cr>]])
local M = {}
function M.base64()
	local line = vim.api.nvim_get_current_line()
	local left, right = unpack(vim.split(line, "="))
	local output = io.popen("echo " .. right .. "|base64 -w 0")
	local result = output:read("*a")
	vim.api.nvim_set_current_line(left .. "=" .. result)
end

function M.base64d()
	local line = vim.api.nvim_get_current_line()
	local left, right = unpack(vim.split(line, "="))
	local output = io.popen("echo " .. right .. "|base64 -d -w 0")
	local result = output:read("*a")
	vim.api.nvim_set_current_line(left .. "=" .. result)
end

nnoremap("<leader>en", function()
	M.base64()
end)
nnoremap("<leader>ed", function()
	M.base64d()
end)
vim.api.nvim_create_user_command("Base64Encode", M.base64)
vim.api.nvim_create_user_command("Base64Decode", M.base64d)
