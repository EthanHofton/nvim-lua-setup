-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"bluz71/vim-nightfly-guicolors",
	"numToStr/Comment.nvim",
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"kyazdani42/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"nvim-lualine/lualine.nvim",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",

	-- Fuzzy finding
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	"nvim-telescope/telescope-ui-select.nvim",

	-- UI
	"MunifTanjim/nui.nvim",
	"aznhe21/actions-preview.nvim",

	-- LSP
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Python
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	"ray-x/lsp_signature.nvim",
})
