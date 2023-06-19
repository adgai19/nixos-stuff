local present, ls = pcall(require, "luasnip")
if not present then
	return
end

-- settings
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	region_check_events = nil,
	enable_autosnippets = nil,
	ext_opts = nil,
})
vim.keymap.set({ "i", "s" }, "<m-n>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<m-e>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<m-k>", function()
	if ls.choice_active(-1) then
		ls.change_choice(-1)
	end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
-- snippets
-- local lua_snippets = require("adgai.snippets.lua").lua_snippets
-- local all_snippets = require("adgai.snippets.all").snippets
-- local ts_snippets = require("adgai.snippets.javascript").javascript_snippets
--
-- ls.add_snippets("all", all_snippets)
-- ls.add_snippets("lua", lua_snippets)
-- ls.add_snippets("javascript", ts_snippets)
-- ls.add_snippets("typescript", ts_snippets)

-- ls.snippets = require("luasnip-snippets").load_snippets()
