local createPopup = function()
	local Popup = require("nui.popup")
	local event = require("nui.utils.autocmd").event

	local buf = vim.api.nvim_create_buf(false, true)
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
				top = "command runner",
				top_align = "center",
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
	popup:map("n", "<esc>", function(bufnr)
		print(bufnr)
		popup:unmount()
	end)
	popup:on({ event.BufLeave }, function()
		popup:unmount()
	end, { once = true })
	return buf, popup
end

local runner = function(command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("Runner", { clear = true }),
		buffer = 0,
		callback = function()
			print("runner is running")
			local popup_buf, popup = createPopup()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(popup_buf, -1, -1, false, data)
				end
			end
			vim.api.nvim_buf_set_lines(popup_buf, 0, -1, false, command)
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
			popup:mount()
		end,
	})
end

vim.api.nvim_create_user_command("Runner", function()
	print("runner starts")
	local command = vim.split(vim.fn.input("enter command> "), " ")
	runner(command)
end, {})
