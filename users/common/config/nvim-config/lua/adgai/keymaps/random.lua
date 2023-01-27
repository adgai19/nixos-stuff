local nnoremap = require("adgai.keymaps.helpers").nnoremap
local vnoremap = require("adgai.keymaps.helpers").vnoremap
local inoremap = require("adgai.keymaps.helpers").inoremap
local xnoremap = require("adgai.keymaps.helpers").xnoremap
local tnoremap = require("adgai.keymaps.helpers").tnoremap

nnoremap(";", ":")
nnoremap(":", ";")

-- hjkl remaps
nnoremap("j", "e")
nnoremap("e", "j")
nnoremap("k", "n")
nnoremap("n", "k")
vnoremap("j", "e")
vnoremap("e", "j")
vnoremap("k", "n")
vnoremap("n", "k")

-- quick quit
nnoremap("<M-q>", "<cmd>q<CR>")

-- inoremap(";;", "<esc>A;<CR>")

-- move text up and down
vnoremap("E", ":m '>+1<CR>gv=gv")
vnoremap("N", ":m '<-2<CR>gv=gv")

-- split and resize
nnoremap("<Leader>=", ":vertical resize +5<CR>")
nnoremap("<Leader>-", ":vertical resize -5<CR>")
nnoremap("<Leader>h", " :split<cr>")
nnoremap("<Leader>v", " :vsplit<cr>")

-- quick source
nnoremap("<Leader>s", " :w<cr>:so %<cr>")

nnoremap("<space>ca", "require('code_action_menu').open_code_action_menu")

-- dead reg keymaps
xnoremap("<leader>p", '"_dP')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("<leader>cf", "<cmd>Explore<cr>")

nnoremap("Q", "@q")
nnoremap("J", "mzJ`z")

nnoremap("<C-up>", "<cmd>tabnext<cr>")
nnoremap("<C-down>", "<cmd>tabprevious<cr>")

vnoremap("<", " <gv")
vnoremap(">", " >gv")

tnoremap([[<Esc>]], [[<C-\><C-n>]])
nnoremap([[\]], ":Rg<space>")
nnoremap([[<leader><leader>]], ":nohl<cr>")
nnoremap([[<Esc>]], [[<cmd>w<cr>]])

-- vim.keymap.set('i', '<C-g>', function ()
--       return vim.fn['codeium#Accept']()
--     end, { expr = true })
