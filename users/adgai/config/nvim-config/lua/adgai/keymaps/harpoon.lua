local nnoremap = require("adgai.keymaps.helpers").nnoremap

nnoremap("<leader>na", require("harpoon.mark").add_file)
nnoremap("<leader>ni", require("harpoon.ui").toggle_quick_menu)
nnoremap("<leader>np", require("harpoon.cmd-ui").toggle_quick_menu)

nnoremap("<M-t>", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')

nnoremap("<M-n>", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
nnoremap("<M-h>", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
nnoremap("<M-e>", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')

nnoremap("<M-l>", require("harpoon.ui").toggle_quick_menu)
nnoremap("<M-c>", require("harpoon.ui").nav_file)

nnoremap(
	"<silent> <leader>ns",
	'<cmd>lua require("harpoon.term").sendCommand(1, 1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>'
)
nnoremap(
	"<silent> <leader>no",
	'<cmd>lua require("harpoon.term").sendCommand(2, 2)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
)
nnoremap(
	"<silent> <leader>nw",
	'<cmd>lua require("harpoon.term").sendCommand(1, 3)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
)
nnoremap(
	"<silent> <leader>nf",
	'<cmd>lua require("harpoon.term").sendCommand(2, 4)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
)

nnoremap("<silent> <leader>nc", '<cmd>lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>')
nnoremap("<silent> <leader>nk", '<cmd>lua require("harpoon.term").gotoTerminal(2)<CR>a<CR>')
