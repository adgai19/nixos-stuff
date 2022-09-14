----"hello world"--"hello world"-- local notify = vim.notify

local level = vim.lsp.log_levels
notify("hello world", level.INFO)
local lines = vim.fn.getline(".")

print(lines)

local function mysplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end
lines = string.gsub(lines, '"', "")
lines = string.gsub(lines, "nnoremap ", "")
lines = mysplit(lines)
print(vim.inspect(lines))
local newline = string.format('"%s","%s"', lines[1], lines[3])
print(newline)
vim.fn.setreg("+", newline)
local mc = require("java.mkclass")
local temp = vim.fn.getpos("'^")
local _, line, character, _ = unpack(temp)
print(line, character)

-- print(vim.inspect(ts.get_node_at_cursor()))
mc.create_class()

function P(item)
	print(vim.inspect(item))
end
-- P(region)
-- textedits.region = region
-- P(textedits)
local range = { line = 0, character = 0 }
local textedits = {
	{
		range = { start = range, ["end"] = range },
		newText = '--"hello world"',
		-- bufnr=68
	},
}
---- vim.lsp.util.apply_text_edits(textedits,68)
--local str = "ash.gyn.ken"
--print(string.gsub(str, "%.", "/"))

--local fn = funct
