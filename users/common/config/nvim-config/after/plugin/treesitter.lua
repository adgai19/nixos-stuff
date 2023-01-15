local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}

parser_configs.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}
-- Defines a read-write directory for treesitters in nvim's cache dir

-- In your treesitter config,

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true, -- false will disable the whole extension
	},

	autotag = {
		enable = true,
	},

incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },

	context_commentstring = {
		enable = true,
	},

	indent = { enable = false },
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},

	navigation = {
		enable = true,
		keymaps = {
			goto_definition = "gnd",
			list_definitions = "gnD",
			list_definitions_toc = "gO",
			goto_next_usage = "<a-*>",
			goto_previous_usage = "<a-#>",
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
	},

	-- playground = {
	-- 	enable = true,
	-- 	disable = {},
	-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	-- 	persist_queries = false, -- Whether the query persists across vim sessions
	-- 	keybindings = {
	-- 		toggle_query_editor = "o",
	-- 		toggle_hl_groups = "i",
	-- 		toggle_injected_languages = "t",
	-- 		toggle_anonymous_nodes = "a",
	-- 		toggle_language_display = "I",
	-- 		focus_language = "f",
	-- 		unfocus_language = "F",
	-- 		update = "R",
	-- 		goto_node = "<cr>",
	-- 		show_help = "?",
	-- 	},
	-- },
})

--
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		---- For all filetypes
		---- Note that setting an entry here replaces all other patterns for this entry.
		---- By setting the 'default' entry below, you can control which nodes you want to
		---- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			"for", -- These won't appear in the context
			-- 'while',
			-- 'if',
			-- 'switch',
			-- 'case',
		},
	},
	zindex = 20, -- The Z-index of the context window
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
})
