local qmk = require("qmk")
local conf = {
	name = "LAYOUT_6x6",
	layout = {
		"x x x x x x _ _ _ _ _ _ x x x x x x",
		"x x x x x x _ _ _ _ _ _ x x x x x x",
		"x x x x x x _ _ _ _ _ _ x x x x x x",
		"x x x x x x _ _ _ _ _ _ x x x x x x",
		"x x x x x _ _ _ _ _ _ _ _ x x x x x",
		"_ _ _ _ _ x x _ _ _ _ x x _ _ _ _ _",
		"_ _ _ _ _ _ x _ _ _ _ x _ _ _ _ _ _",
		"_ _ _ _ x x x _ _ _ _ x x x _ _ _ _",
	},
}
require("qmk").setup(conf)
