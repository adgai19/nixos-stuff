-- require("neorg").setup({
--   ---- Tell Neorg what modules to load
--   load = {
--     ["core.defaults"] = {}, -- Load all the default modules
--     ["core.keybinds"] = { -- Configure core.keybinds
--       config = {
--         default_keybinds = true, -- Generate the default keybinds
--         neorg_leader = "<Leader>o", -- This is the default if unspecified
--       },
--     },
--     ["core.norg.concealer"] = {}, -- Allows for use of icons
--     ["core.norg.dirman"] = { -- Manage your directories with Neorg
--       config = { workspaces = { my_workspace = "~/neorg" } },
--     },
--   },
--   logger = { level = "trace" },
-- })
local m = {}
m.open_git_repo = function()
	-- print("hello world")
	local line = vim.fn.getline(".")
	print(line)
	line, _ = string.gsub(line, "use", "")
	-- print(string.gsub(line, "%'", ""))
	line, _ = string.gsub(line, "%'", "")
	line, _ = string.gsub(line, " ", "")
	print("github.com/" .. line)
	-- vim.cmd[string.format("!xdg_open https://github.com/%s",line)]
	-- line = string.gsub(line, "Plug", "")
	-- print(line)
	-- line = line.gsub("\\'", "")
	-- print(line)
end

local path = require("plenary.path")
-- print(path.path.home)
-- print(vim.inspect(path))
-- print(path.exists(path.path.home))

return m
-- Plug 'temp/ext'
