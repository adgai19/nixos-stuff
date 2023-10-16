-- Lua
local actions = require("diffview.actions")

require("diffview").setup()
local nnoremap = require("adgai.keymaps.helpers").nnoremap
nnoremap("<leader>do", "<cmd>DiffviewOpen<cr>")
nnoremap("<leader>dc", "<cmd>DiffviewClose<cr>")
