-- order matters
require("plugins.config.nvim-treesitter")
require("plugins.config.nvim-cmp")
require("plugins.config.null-ls")
require("plugins.config.lspsaga")
require("plugins.config.telescope")
require("plugins.config.lualine")

return require("packer").startup(function(use)
	-- instead, we use a package mamager
	-- use 'wbthomason/packer.nvim'

	-- nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- nvim-cmp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- luasnip
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- neodev
	use("folke/neodev.nvim")

	use("ray-x/lsp_signature.nvim")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- themes
	use("navarasu/onedark.nvim")

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- better-escape
	use("max397574/better-escape.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	use("p00f/clangd_extensions.nvim")

	use("cappyzawa/trim.nvim")
end)
