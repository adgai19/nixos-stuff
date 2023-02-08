require("todo-comments").setup({})
require("trouble").setup({})
-- require("inc_rename").setup()
require("Comment").setup()
require("notify").setup({
	background_colour = "#000000",
})
vim.notify = require("notify")
require("nvim-autopairs").setup({})
require("gitsigns").setup()
require("nvim-surround").setup()

-- require("auto-save").setup({
-- 	debounce_delay = 3000, -- saves the file at most every `debounce_delay` milliseconds
-- 	trigger_events = { "CursorHold" },
-- })
require("dap-go").setup()
require("regexplainer").setup()
require("statuscol").setup({
	setopt = true,
})

require('leap').add_default_mappings()
require('flit').setup()
