local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "hello world", "new buf" })
local popup = Popup({
	position = "50%",
	size = {
		width = 150,
		height = 40,
	},
	bufnr = buf,
	enter = true,
	focusable = true,
	zindex = 50,
	relative = "editor",
	border = {
		padding = {
			top = 2,
			bottom = 2,
			left = 3,
			right = 3,
		},
		style = "rounded",
		text = {
			top = " I am top title ",
			top_align = "center",
			bottom = "I am bottom title",
			bottom_align = "left",
		},
	},
	buf_options = {
		modifiable = true,
		readonly = false,
	},
	win_options = {
		winblend = 10,
		winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
	},
})
popup:mount()
popup:map("n", "<esc>", function(bufnr)
	print(bufnr)
	popup:unmount()
end)
popup:on({ event.BufLeave }, function()
	popup:unmount()
end, { once = true })
