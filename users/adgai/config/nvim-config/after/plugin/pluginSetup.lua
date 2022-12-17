require("todo-comments").setup({})
require("trouble").setup({})
-- require("inc_rename").setup()
require("Comment").setup()
require("notify").setup({
	background_colour = "#000000",
})
vim.notify = require("notify")
require("which-key").setup({})
require("nvim-autopairs").setup({})
require("gitsigns").setup()
require("nvim-surround").setup()
-- require("auto-save").setup()
require("noice").setup()
-- require('drop').setup({
--   screensaver = 1000 * 5, -- show after 5 minutes. Set to false, to disable
-- })
--
require("dap-go").setup()
require("regexplainer").setup()
