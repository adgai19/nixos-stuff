-- local M = {}
-- -- DAPInstall
-- local dap_install = require("dap-install")
-- dap_install.setup({
-- 	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
-- })

-- telescope-dap
require("telescope").load_extension("dap")

-- nvim-dap-virtual-text. Show virtual text for current frame
-- vim.g.dap_virtual_text = true -- deprecated

-- nvim-dap-ui
require("dapui").setup({})

-- languages
require("adgai.dap.go")
require("adgai.dap.node")
require("adgai.dap.lua")
require("adgai.dap.typescript")

-- nvim-dap
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
--
-- vim.g.vimspector_enable_mappings = ""
