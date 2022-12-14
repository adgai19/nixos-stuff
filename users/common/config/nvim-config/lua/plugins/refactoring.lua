local refactor = require("refactoring")
refactor.setup()
print("refactoring loaded")
-- telescope refactoring helper
local function refactor(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end
local M = {}
M.refactors = function()
	require("telescope.pickers")
		.new({}, {
			prompt_title = "refactors",
			finder = require("telescope.finders").new_table({ results = require("refactoring").get_refactors() }),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", refactor)
				map("n", "<CR>", refactor)
				return true
			end,
		})
		:find()
end

return M
