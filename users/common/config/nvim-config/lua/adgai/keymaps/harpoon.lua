local nnoremap = require("adgai.keymaps.helpers").nnoremap
local harpoon=require("harpoon")

harpoon:setup()

nnoremap("<leader>na", function() harpoon:list():append() end)
nnoremap("<leader>ni", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- nnoremap("<leader>np", require("harpoon.cmd-ui").toggle_quick_menu)
--


nnoremap("<M-t>",function() harpoon:list():select(1) end)--)
nnoremap("<M-n>",function() harpoon:list():select(2) end)--)
nnoremap("<M-h>",function() harpoon:list():select(3) end)--)
nnoremap("<M-e>",function() harpoon:list():select(4) end)--)
--
--
nnoremap("<M-l>", function() harpoon:list():append() end)
nnoremap("<M-c>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- nnoremap(
-- 	"<M-w>",
-- 	'<cmd>lua require("harpoon.term").sendCommand(1, 1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>'
-- )
-- nnoremap(
-- 	"<M-r>",
-- 	'<cmd>lua require("harpoon.term").sendCommand(2, 2)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
-- )
-- nnoremap(
-- 	"<M-f>",
-- 	'<cmd>lua require("harpoon.term").sendCommand(1, 3)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
-- )
-- nnoremap(
-- 	"<M-u>",
-- 	'<cmd>lua require("harpoon.term").sendCommand(2, 4)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
-- )
--
-- nnoremap("<M-,>", '<cmd>lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>')
-- nnoremap("<M-m>", '<cmd>lua require("harpoon.term").gotoTerminal(2)<CR>a<CR>')
