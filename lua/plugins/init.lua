-- install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
local plugins = {

    -- onedark
    {
        -- "navarasu/onedark.nvim",
        "olimorris/onedarkpro.nvim",
        lazy = false, -- always load theme
        priority = 1000, -- load first before any plugins
        config = function()
            -- require("plugins.config.onedark")
            require("plugins.config.onedarkpro")
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require("plugins.config.lualine")
        end,
        -- dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "romgrk/barbar.nvim",
        -- event = "VeryLazy",
        lazy = false,
        config = function()
            require("plugins.config.barbar")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "utilyre/barbecue.nvim",
        -- commit = "0a3e2d88167dd983fcdf9911801d1b809295e865",
        lazy = false,
        -- event = "VeryLazy",
        -- branch = "dev", -- omit this if you only want stable updates
        config = function()
            require("plugins.config.barbecue")
        end,
        dependencies = {
            "neovim/nvim-lspconfig",
            "smiteshp/nvim-navic",
            -- "kyazdani42/nvim-web-devicons", -- optional dependency
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },

    -- nvim-tree, file exploer
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false, -- must be on the first screen
        config = function()
            require("plugins.config.nvim-tree")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
    },

    -- Mason

    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.config.mason")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("plugins.config.mason-lspconfig")
        end,
        require = {
            "williamboman/mason.nvim",
        },
    },

    {
        "lvimuser/lsp-inlayhints.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.config.lsp-inlayhints")
        end,
    },

    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require("plugins.config.lspconfig")
        end,

        dependencies = {
            -- optional
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
            "ray-x/lsp_signature.nvim",
            -- ! order matters
            "lvimuser/lsp-inlayhints.nvim",
        },
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        config = function()
            require("plugins.config.nvim-cmp")
        end,

        dependencies = {
            -- as required by spec
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            -- known will be loaded
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            -- custom dependencies
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "jose-elias-alvarez/null-ls.nvim",
            "nvim-telescope/telescope.nvim",
            -- for icons
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
            -- for icon in nvim-cmp
            "onsails/lspkind.nvim",
        },
    },

    -- debugger
    {
        "mfussenegger/nvim-dap",
        -- load manully
        -- event = "VeryLazy",
        config = function()
            require("plugins.config.debugger")
        end,
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
        },
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("plugins.config.virtual-text")
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dapui").setup({})
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

    -- treesitter-context
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require("plugins.config.context")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },

    -- better comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.config.todo_comments")
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- neodev
    {
        "folke/neodev.nvim",
        config = function()
            require("plugins.config.neodev")
        end,
    },

    -- lsp_signature
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.config.lsp_signature")
        end,
    },

    {
        "smiteshp/nvim-navic",
        config = function()
            require("plugins.config.nvim-navic")
        end,
        dependencies = { "neovim/nvim-lspconfig" },
    },

    -- luasnip
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

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

    -- telescope/ui-select
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },

    -- use("lvimuser/lsp-inlayhints.nvim")

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.config.noice")
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },

    -- symbols
    {
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.config.symbols-outline")
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.config.gitsigns")
        end,
    },

    -- better-escape
    {
        "max397574/better-escape.nvim",
        event = "VeryLazy",
        -- event = "InsertEnter",
        -- lazy = false, -- always load
        config = function()
            require("plugins.config.better-escape")
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        -- event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- trim
    {
        "cappyzawa/trim.nvim",
        event = "VeryLazy",
        -- event = "BufWritePre",
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
        colorscheme = { "onedark_vivid" },
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
