local highlight_yank = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
	group = highlight_yank,
})

local markdownSpell = vim.api.nvim_create_augroup("markdownSpell", { clear = true })
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", group = markdownSpell, command = "setlocal spell" })
vim.api.nvim_create_autocmd(
	{ "Bufread", "BufNewFile " },
	{ command = "setlocal spell", pattern = "*.md", group = markdownSpell }
)

local texSpell = vim.api.nvim_create_augroup("markdownSpell", { clear = true })
vim.api.nvim_create_autocmd("FileType", { pattern = "latex", group = markdownSpell, command = "setlocal spell" })
vim.api.nvim_create_autocmd(
	{ "Bufread", "BufNewFile " },
	{ command = "setlocal spell", pattern = "*.tex", group = texSpell }
)

local tmux = vim.api.nvim_create_augroup("tmux", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", { pattern = "tmux", command = "set filetype=tmux", group = tmux })

local qflist = vim.api.nvim_create_augroup("qflist", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ pattern = "quickfix", callback = require("adgai.cyclekeymaps").change_mode_qf, group = qflist }
)
vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
		if vim.bo.filetype == "qf" then
			require("adgai.cyclekeymaps").change_mode_qf()
		end
	end,
	group = vim.api.nvim_create_augroup("qflist", { clear = true }),
})
vim.api.nvim_create_autocmd(
	"BufWritePre",
	{ pattern = "nix", command = "!nixpkgs-fmt %", group = vim.api.nvim_create_augroup("nix-fmt", { clear = true }) }
)

vim.api.nvim_create_autocmd(
	"BufWritePre",
	{ pattern = "lua", command = "!stylua %", group = vim.api.nvim_create_augroup("lua-fmt", { clear = true }) }
)
vim.api.nvim_create_autocmd({"BufReadPost","BufNewFile"},{
  once = true,
  callback=function ()
  if vim.fn.has "wsl"==1 then
    vim.g.clipboard = {
      copy = {
        ["+"]="win32yank.exe -i --crlf",
        ["*"]="win32yank.exe -i --crlf",
      },
      paste ={
        ["+"]="win32yank.exe -o --crlf",
        ["*"]="win32yank.exe -o --crlf",

      }
    }
  end
  end
})
vim.api.nvim_create_autocmd("VimResized",{
  command="wincmd =",
  group = vim.api.nvim_create_augroup("resizeSplit",{clear=true})
})
-- local linters = vim.api.nvim_create_augroup("linters", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", { callback = vim.diagnostic.setloclist, group = linters })
-- vim.api.nvim_create_autocmd("BufWritePost", { callback = require("adgai.cyclekeymaps").change_mode, group = linters })
