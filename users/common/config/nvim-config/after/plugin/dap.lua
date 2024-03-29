local dap = require("dap")
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

local Hydra = require("hydra")
local nnoremap = require("adgai.keymaps.helpers").nnoremap

local dapHydra = Hydra({
	name = "dap",
	mode = "n",
	heads = {
		{
			"n",
			function()
				dap.continue()
			end,
		},
		{ "R", "<cmd>lua require'dap'.run_to_cursor()<cr>" },
		{ "E", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>" },
		{ "C", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>" },
		{ "U", "<cmd>lua require'dapui'.toggle()<cr>" },
		{ "b", "<cmd>lua require'dap'.step_back()<cr>" },
		{ "c", "<cmd>lua require'dap'.continue()<cr>" },
		{ "d", "<cmd>lua require'dap'.disconnect()<cr>" },
		{ "e", "<cmd>lua require'dapui'.eval()<cr>" },
		{ "g", "<cmd>lua require'dap'.session()<cr>" },
		{ "h", "<cmd>lua require'dap.ui.widgets'.hover()<cr>" },
		{ "S", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>" },
		{ "i", "<cmd>lua require'dap'.step_into()<cr>" },
		{ "o", "<cmd>lua require'dap'.step_over()<cr>" },
		{ "p", "<cmd>lua require'dap'.pause.toggle()<cr>" },
		{ "q", "<cmd>lua require'dap'.close()<cr>" },
		{ "r", "<cmd>lua require'dap'.repl.toggle()<cr>" },
		{ "s", "<cmd>lua require'dap'.continue()<cr>" },
		{ "t", "<cmd>lua require'dap'.toggle_breakpoint()<cr>" },
		{ "x", "<cmd>lua require'dap'.terminate()<cr>" },
		{ "u", "<cmd>lua require'dap'.step_out()<cr>" },
	},

	config = {
		on_enter = function()
			vim.notify("inside DAP hydra")
		end,
		on_exit = function()
			vim.notify("out of DAP hydra")
		end,
		foreign_keys = "run",
	},
	hint = [[
  dap mode
  ]],
})
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
	dapHydra:activate()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
	dapHydra:exit()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
	dapHydra:exit()
end
nnoremap("<leader>dn", function()
	dap.continue()
end)
nnoremap("<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>")
nnoremap("<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>")
nnoremap("<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>")
nnoremap("<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>")
nnoremap("<leader>db", "<cmd>lua require'dap'.step_back()<cr>")
nnoremap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
nnoremap("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>")
nnoremap("<leader>de", "<cmd>lua require'dapui'.eval()<cr>")
nnoremap("<leader>dg", "<cmd>lua require'dap'.session()<cr>")
nnoremap("<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>")
nnoremap("<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>")
nnoremap("<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
nnoremap("<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
nnoremap("<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>")
nnoremap("<leader>dq", "<cmd>lua require'dap'.close()<cr>")
nnoremap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
nnoremap("<leader>ds", "<cmd>lua require'dap'.continue()<cr>")
nnoremap("<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
nnoremap("<leader>dx", "<cmd>lua require'dap'.terminate()<cr>")
nnoremap("<leader>du", "<cmd>lua require'dap'.step_out()<cr>")
--:lua require"jester".run()
--:lua require"jester".run_file()
--:lua require"jester".run_last()
--:lua require"jester".debug()
--:lua require"jester".debug_file()
--:lua require"jester".debug_last()
local DEBUGGER_PATH = os.getenv("HOME") .. "/dev/microsoft/vscode-js-debug"
require("dap-vscode-js").setup({
	node_path = "node",
	debugger_path = DEBUGGER_PATH,
	-- debugger_cmd = { "js-debug-adapter" },
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}
-- dap.configurations.javascript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require'dap.utils'.pick_process,
--   },
-- }
for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end
