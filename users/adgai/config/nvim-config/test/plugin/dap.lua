local has_dap, dap = pcall(require, "dap")
if not has_dap then
	return
end
require("nvim-dap-virtual-text").setup({
	enabled = true,

	-- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
	enabled_commands = false,

	-- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_changed_variables = true,
	highlight_new_as_changed = true,

	-- prefix virtual text with comment string
	commented = false,

	show_stop_reason = true,

	-- experimental features:
	virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
})

require("dapui").setup()

local nnoremap = require("keymaps.helpers").nnoremap
-- nnoremap("<leader>dn", dap.continue)
-- nnoremap("<leader>db", dap.toggle_breakpoint)
-- nnoremap("<leader>di", dap.step_in)
-- nnoremap("<leader>do", dap.step_out)
--:lua require"jester".run()
--:lua require"jester".run_file()
--:lua require"jester".run_last()
--:lua require"jester".debug()
--:lua require"jester".debug_file()
--:lua require"jester".debug_last()
