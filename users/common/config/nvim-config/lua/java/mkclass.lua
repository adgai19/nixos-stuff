local vim = vim
local M = {}
local function takeprompt()
	local classname = vim.fn.input("enter classname> ")
	print("classname ")
	print(classname)
	-- TODO set completion for package_name
	local package_name = vim.fn.input({ prompt = "enter package_name> " })
	print("\npackage_name= ", package_name)
	vim.cmd(string.format("!mkdir %s", string.gsub(package_name, "%.", "/")))

	return classname, package_name
end

local function create_file(package_name, classname)
	local file_name_temp = string.format("%s/%s.java", string.gsub(package_name, "%.", "/"), classname)
	local file_name = vim.fn.input("Create File: Name > ", file_name_temp)
	vim.cmd(":vnew")
	vim.cmd(string.format(":set filetype=java"))
	vim.cmd(string.format(":w! %s", file_name))
	print(file_name)
	return vim.fn.bufnr()
	-- code
end
local function txedit(packagename, classname, isMain)
	local main = " "
	if isMain then
		main = [[    public static void main(String args[])
    {}]]
	end
	local addtext = string.format(
		[[
package %s

public class %s{
  %s
}
]],
		packagename,
		classname,
		main
	)
	local range = { line = 0, character = 0 }
	local textedits = { {
		range = { start = range, ["end"] = range },
		newText = addtext,
		bufnr = 68,
	} }
	return textedits
end
function M.create_class()
	local classname, packagename = takeprompt()
	print(classname, packagename)
	local bufnr = create_file(packagename, classname)
	print(bufnr)
	local ismain = vim.fn.input("need main??")
	local textedits = txedit(packagename, classname, ismain)
	vim.lsp.util.apply_text_edits(textedits, bufnr)
end
return M
