local cmp = require("cmp")
cmp.setup({
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	sorting = {
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.offset,
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				return entry1_under < entry2_under
				-- if entry1_under > entry2_under then
				--   return false
				-- elseif entry1_under < entry2_under then
				--   return true
				-- end
			end,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	sources = {
		{ name = "nvim_lsp" },
		-- { name = "luasnip", max_item_count = 4 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua", keyword_length = 6, max_item_count = 10 },
		{ name = "buffer", keyword_length = 6, max_item_count = 3 },
		-- { name = "cmp_tabnine", max_item_count = 6, keyword_length = 3 },
		{ name = "path", keyword_length = 6, max_item_count = 3 },
	},
})

cmp.setup.filetype("gitcommit", {
	mapping = cmp.mapping.preset.cmdline({}),
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})
