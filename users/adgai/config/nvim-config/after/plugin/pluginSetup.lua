require("todo-comments").setup({})
require("trouble").setup({})
require("inc_rename").setup()
require("Comment").setup()
require("notify").setup({
background_colour = "#000000",
})
vim.notify = require("notify")
require("which-key").setup({})
require("nvim-autopairs").setup({})
require("gitsigns").setup()
require("nvim-surround").setup()
