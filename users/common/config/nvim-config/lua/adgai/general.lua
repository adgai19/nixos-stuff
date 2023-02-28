vim.g.mapleader = " "
vim.opt.hidden = true
vim.opt.autowrite = true
vim.opt.wrap = false
vim.opt.encoding = "utf-8"
vim.opt.pumheight = 30
vim.opt.fileencoding = "utf-8"
vim.opt.ruler = true

vim.opt.iskeyword = vim.opt.iskeyword + "-"
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.showmode = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.showtabline = 2
-- vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.formatoptions = vim.opt.formatoptions - "cro"
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.smartcase = true

-- vim.opt.lazyredraw = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.swapfile = false
vim.opt.ignorecase = false
vim.opt.autochdir = true
vim.cmd([[au! BufWritePost $MYVIMRC source %]])
vim.opt.incsearch = true
vim.opt.confirm = true
vim.opt.showtabline = 0
vim.opt.compatible = false
vim.wo.colorcolumn = "120"
-- vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=none]])
vim.g[":tmux_navigator_save_on_switch"] = 2
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
-- vim.opt.shell = "/bin/zsh"
-- vim.g["python3_host_prog"] = "/usr/bin/python3"
vim.opt.undodir = vim.fn.expand("~") .. "/.config/nvim/undodir/undo"
vim.opt.undofile = true
vim.opt.number = true
vim.opt.cmdheight = 0
vim.cmd([[
set iskeyword-=_
]])

vim.opt.background = "dark"
vim.cmd([[
set path=..
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]])

vim.opt.updatetime = 2000

vim.g.grepprog = "rg"
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = 80
