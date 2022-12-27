-- install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- plugins
local plugins = {

	-- themes
	"navarasu/onedark.nvim",

	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		--[[ run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
        ]]
	},

	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},

	-- luasnip
	{ "L3MON4D3/LuaSnip", dependencies = {
		"saadparwaiz1/cmp_luasnip",
	} },

	-- neodev
	"folke/neodev.nvim",

	"ray-x/lsp_signature.nvim",

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- use("lvimuser/lsp-inlayhints.nvim")
	"simrat39/symbols-outline.nvim",

	-- tab line
	{ "romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		-- dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- better-escape
	"max397574/better-escape.nvim",

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	"p00f/clangd_extensions.nvim",

	"cappyzawa/trim.nvim",
}

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "onedark" },
	},
}

require("lazy").setup(plugins, opts)
-- order matters
require("plugins.config.nvim-treesitter")
require("plugins.config.nvim-cmp")
require("plugins.config.null-ls")
require("plugins.config.lspsaga")
require("plugins.config.telescope")
require("plugins.config.lualine")
require("plugins.config.nvim-tree")
require("plugins.config.barbar")
-- require("plugins.config.lsp-inlayhints")
require("plugins.config.symbols-outline")
