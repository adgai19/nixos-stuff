-- vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
require("tokyonight").setup({
	transparent = true, -- Enable this to disable setting the background color
	style = "night",
	terminal_colors = true, -- Configure
	dim_inactive = true, -- dims inactive windows
	hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
})

vim.o.termguicolors = true
vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#0a0a0a
    augroup END
]])

vim.cmd([[colorscheme tokyonight]])
vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
]])
require("notify").setup({ background_colour = "#000000" })
