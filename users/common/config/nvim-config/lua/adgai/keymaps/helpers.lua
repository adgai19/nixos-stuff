local function nnoremap(lhs, rhs, option)
	option = option or {}
	vim.keymap.set("n", lhs, rhs, option)
end

local function vnoremap(lhs, rhs, option)
	option = option or {}
	vim.keymap.set("v", lhs, rhs, option)
end

local function inoremap(lhs, rhs, option)
	option = option or {}
	vim.keymap.set("i", lhs, rhs, option)
end

local function xnoremap(lhs, rhs, option)
	option = option or {}
	vim.keymap.set("x", lhs, rhs, option)
end

local function tnoremap(lhs, rhs, option)
	option = option or {}
	vim.keymap.set("t", lhs, rhs, option)
end
return { nnoremap = nnoremap, vnoremap = vnoremap, inoremap = inoremap, xnoremap = xnoremap, tnoremap = tnoremap }
