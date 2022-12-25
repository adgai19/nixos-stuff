local M = {}
-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local action_layout = require("telescope.actions.layout")
local telescope = require("telescope")
telescope.setup({
	defaults = {
		-- layout_strategy = "horizontal",
		-- p
		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_ignore_patterns = { "build/", "bin/", "target/", "node_modules" },
		prompt_prefix = ">",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		-- shorten_path = true,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble, ["<M-p>"] = action_layout.toggle_preview },
			n = { ["<c-t>"] = trouble.open_with_trouble, ["<M-p>"] = action_layout.toggle_preview },
		},
	},
	pickers = {
		git_branches = {
			theme = "dropdown",
		},
	},

	extensions = {
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			workspaces = {
				["conf"] = "/home/adgai/.config",
				["project"] = "/home/adgai/projects",
			},
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("fzf")
-- require("telescope").load_extension("frecency")
require("telescope").load_extension("ui-select")
-- require("telescope").load_extension("project")
-- require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("packer")
