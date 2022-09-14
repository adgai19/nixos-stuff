local packer = require("plugins.packerInit")
local use = packer.use
return packer.startup(function()
	use("lewis6991/impatient.nvim")
	use({
		"wbthomason/packer.nvim",
	})

	-- tmux helpers
	-- use("christoomey/vim-tmux-navigator")
	use("tmux-plugins/vim-tmux")
	use("preservim/vimux")

	-- helpers
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("MunifTanjim/nui.nvim")
	-- use("BurntSushi/ripgrep")
	-- use("sharkdp/fd")
	-- use("haringsrob/nvim_context_vt")
	use("https://github.com/airblade/vim-rooter")
	-- use("nyngwang/NeoRoot.lua")

	-- completion
	-- use({ "rafamadriz/friendly-snippets" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({ "L3MON4D3/LuaSnip", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

	use("hrsh7th/cmp-cmdline")
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
	-- use({ "mlaursen/vim-react-snippets", after = "cmp-path" })
	use("onsails/lspkind-nvim")
	-- use("glepnir/lspsaga.nvim")
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	-- telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", after = "telescope.nvim" })
	use({ "nvim-telescope/telescope-project.nvim", after = "telescope.nvim" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "tami5/sqlite.lua" },
		after = "telescope.nvim",
	})
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "nvim-telescope/telescope-packer.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim", after = "telescope.nvim" })

	-- folke stuff
	-- cool guy with cool plugins
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use("folke/lsp-colors.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"folke/tokyonight.nvim",
	})
	-- not working till some plenary stuff works itself out
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("folke/lsp-trouble.nvim")
	use({ "folke/lua-dev.nvim" })
	--lsp
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	-- use({ "ray-x/lsp_signature.nvim" })
	use("lspcontainers/lspcontainers.nvim")
	use("neovim/nvim-lspconfig")
	use("b0o/schemastore.nvim")
	use({ "mfussenegger/nvim-jdtls" })
	use("kshenoy/vim-signature")
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	use("simrat39/rust-tools.nvim")
	use({ "ray-x/go.nvim", requires = "ray-x/guihua.lua" })
	-- use("ray-x/guihua.lua")
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			local opts = {
				highlight_hovered_item = true,
				show_guides = true,
			}
			require("symbols-outline").setup(opts)
		end,
	})
	use("mfussenegger/nvim-lint")
	use("jose-elias-alvarez/typescript.nvim")

	--tpope
	use("tpope/vim-eunuch")
	use("tpope/vim-surround")
	-- use("tpope/vim-fugitive")
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use("tpope/vim-scriptease")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	--dap
	--TODO need to set this up
	use("mfussenegger/nvim-dap")
	-- use("Pocco81/DAPInstall.nvim")
	-- use("Pocco81/dap-buddy.nvim")
	use("mfussenegger/nvim-dap-python")
	use("theHamsta/nvim-dap-virtual-text")
	use("David-Kunz/jester")
	use("rcarriga/nvim-dap-ui")

	--treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")

	use("nvim-treesitter/nvim-treesitter-context")

	-- ThePrimeagen plugins
	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/git-worktree.nvim")
	use("theprimeagen/jvim.nvim")
	-- use({
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	requires = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- })

	--other helpers
	use("junegunn/rainbow_parentheses.vim")
	use("sbdchd/neoformat")
	use("mhinz/vim-startify")
	use("mfussenegger/nvim-treehopper")
	use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	-- use("mbbill/undotree")
	use("ggandor/lightspeed.nvim")
	use({ "tjdevries/cyclist.vim" })
	use("jeffkreeftmeijer/vim-numbertoggle")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("nacro90/numb.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	-- use({ "norcalli/nvim-colorizer.lua", config = require("colorizer").setup() })
	use({
		"weilbith/nvim-code-action-menu",
	})
	-- use {'stevearc/dressing.nvim'}
	use({ "potatoesmaster/i3-vim-syntax" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "windwp/nvim-ts-autotag" })
	use({ "j-hui/fidget.nvim" })

	use("jremmen/vim-ripgrep")
	-- use("nvim-pack/nvim-spectre")
	use({
		"nvim-neorg/neorg",
		requires = "nvim-lua/plenary.nvim",
		after = "nvim-treesitter",
	})
	use("chrisbra/matchit")
	use("romainl/vim-qf")
	use("pearofducks/ansible-vim")
	use("marcushwz/nvim-workbench")
	use("MattesGroeger/vim-bookmarks")
	use("hashivim/vim-terraform")
	use("anuvyklack/hydra.nvim")
end)
