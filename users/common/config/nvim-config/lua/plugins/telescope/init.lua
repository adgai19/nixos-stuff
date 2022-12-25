local M = {}

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
		file_ignore_patterns = { "autoload/" },
	})
end

M.find_word_under_cursor = function()
	local word = vim.call("expand", "<cword>")
	require("telescope.builtin").grep_string(require("telescope.themes").get_ivy({ search = word }))
end
M.find_word = function()
	local word = vim.fn.input("enter word to search > ")
	require("telescope.builtin").grep_string(require("telescope.themes").get_ivy({ search = word }))
end
M.file_browser = function()
	require("telescope.builtin").file_browser(require("telescope.themes").get_ivy({ previewer = false }))
end

local conf = require("telescope.config").values
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")

local flatten = vim.tbl_flatten

-- i would like to be able to do telescope
-- and have telescope do some filtering on files and some grepping

M.multi_rg = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
	opts.shortcuts = opts.shortcuts or {
		["l"] = "*.lua",
		["v"] = "*.vim",
		["n"] = "*.{vim,lua}",
	}
	opts.pattern = opts.pattern or "%s"

	local custom_grep = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local prompt_split = vim.split(prompt, "  ")

			local args = { "rg" }
			if prompt_split[1] then
				table.insert(args, "-e")
				table.insert(args, prompt_split[1])
			end

			if prompt_split[2] then
				table.insert(args, "-g")

				local pattern
				if opts.shortcuts[prompt_split[2]] then
					pattern = opts.shortcuts[prompt_split[2]]
				else
					pattern = prompt_split[2]
				end

				table.insert(args, string.format(opts.pattern, pattern))
			end

			return flatten({
				args,
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			})
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = "Live Grep (with shortcuts)",
			finder = custom_grep,
			previewer = conf.grep_previewer(opts),
			sorter = require("telescope.sorters").empty(),
		})
		:find()
end
return M
