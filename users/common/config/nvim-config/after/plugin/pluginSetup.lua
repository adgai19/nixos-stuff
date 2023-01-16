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
  require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = nil
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true
        }

        -- Setup keymaps
        vim.keymap.set("n", "<leader>k", require("hover").hover, {desc = "hover.nvim"})
        vim.keymap.set("n", "<leader>K", require("hover").hover_select, {desc = "hover.nvim (select)"})
