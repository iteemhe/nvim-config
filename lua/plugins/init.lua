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

	-- onedark
	{
		"navarasu/onedark.nvim",
		lazy = false, -- always load theme
		config = function()
			require("plugins.config.onedark")
		end,
	},

	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.config.nvim-treesitter")
		end,
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- nvim-lspconfig
	{ "neovim/nvim-lspconfig" },

	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.config.nvim-cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- treesitter for highlight
			"nvim-treesitter/nvim-treesitter",
			-- LuaSnipt for snippets
			"L3MON4D3/LuaSnip",
			-- null-ls for completion
			"jose-elias-alvarez/null-ls.nvim",
			-- lsp config
			"neovim/nvim-lspconfig",
			-- find definition
			"nvim-telescope/telescope.nvim",
		},
	},

	-- luasnip
	{ "L3MON4D3/LuaSnip", dependencies = {
		"saadparwaiz1/cmp_luasnip",
	} },

	-- neodev
	"folke/neodev.nvim",

	"ray-x/lsp_signature.nvim",

	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.config.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- use("lvimuser/lsp-inlayhints.nvim")
	--
	-- symbols
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("plugins.config.symbols-outline")
		end,
	},

	-- bufferline
	{
		"romgrk/barbar.nvim",
		lazy = false,
		config = function()
			require("plugins.config.barbar")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- nvim-tree, file exploer
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = function()
			require("plugins.config.nvim-tree")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},

	-- lspsaga
	{
		"glepnir/lspsaga.nvim",
		lazy = false,
		config = function()
			require("plugins.config.lspsaga")
		end,
		branch = "main",
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.config.gitsigns")
		end,
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		-- dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		lazy = false,
		config = function()
			require("plugins.config.lualine")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- better-escape
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		-- lazy = false, -- always load
		config = function()
			require("plugins.config.better-escape")
		end,
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	"p00f/clangd_extensions.nvim",

	-- trim
	{
		"cappyzawa/trim.nvim",
		event = "BufWritePre",
		config = function()
			require("plugins.config.trim")
		end,
	},
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
-- require("plugins.config.onedark")
-- require("plugins.config.nvim-cmp")
-- require("plugins.config.nvim-treesitter")
-- require("plugins.config.null-ls")
-- require("plugins.config.nvim-tree")
-- require("plugins.config.telescope")
-- require("plugins.config.lspsaga")
-- require("plugins.config.barbar")
-- require("plugins.config.lualine")
-- require("plugins.config.symbols-outline")
-- require("plugins.config.gitsigns")
-- require("plugins.config.lsp-inlayhints")
