local utils = {}
local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= "o" then
		scopes["o"][key] = value
	end
end

function utils.map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.bmap(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end
function utils.nnoremap(lhs, rhs)
	utils.bmap("n", lhs, rhs)
end
function utils.vnoremap(lhs, rhs)
	utils.bmap("v", lhs, rhs)
end
function utils.inoremap(lhs, rhs)
	utils.bmap("i", lhs, rhs)
end
function utils.inspectTable(table)
	print(vim.inspect(table))
end
return utils
