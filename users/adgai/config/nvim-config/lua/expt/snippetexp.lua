local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

-- ls.snippets.all={

-- s("tr", t("Wow! Text!"))
-- }

ls.snippets = {
	all = {

		s("trigger", t("Wow! Text!")),
		s("hello", t("hello world")),
		s("hello2", t("hello 2 world")),
	},
	typescriptreact = {
		s("edf", { t("export default "), i(1), t([[(){ ]]), i(0), t("}") }),
		s("edc", {
			t("export default class "),
			i(1),
			t(" extends React.Component<"),
			i(2),
			t(","),
			i(3),
			t(">{"),
			i(0),
			t("}"),
		}),
	},
}
