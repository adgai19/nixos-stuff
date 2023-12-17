local M = {}
function M.splitOnce(inputstr, sep)
    local prefix, suffix = inputstr:match("(.-)%".. sep .."(.+)")
    local t = {}
    table.insert(t, prefix)
    table.insert(t, suffix)
    return t
end
function M.base64()
	local line = vim.api.nvim_get_current_line()
	local left, right = unpack(M.splitOnce(line, "="))
	local output = io.popen("echo " .. right .. "|base64 -w 0")
    if output == nil then
    return
  end
	local result = output:read("*a")
	vim.api.nvim_set_current_line(left .. "=" .. result)
end

function M.base64d()
	local line = vim.api.nvim_get_current_line()
	local left, right = unpack(vim.split(line, "="))
	local output = io.popen("echo " .. right .. "|base64 -d -w 0")

    if output == nil then
    return
  end
	local result = output:read("*a")
	vim.api.nvim_set_current_line(left .. "=" .. string.gsub( result,"\n","" ))
end


local nnoremap = require("adgai.keymaps.helpers").nnoremap
nnoremap("<leader>en", function()
	M.base64()
end)
nnoremap("<leader>ed", function()
	M.base64d()
end)
vim.notify("hello world")
vim.api.nvim_create_user_command("Base64Encode", M.base64,{})
vim.api.nvim_create_user_command("Base64Decode", M.base64d,{})

