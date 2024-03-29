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
        commit = "3921d775d5db0c9bd42fe4026f68f762e2480475",
        -- event = "VeryLazy",
        lazy = false,
        config = function()
            require("plugins.config.barbar")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "utilyre/barbecue.nvim",
        -- event = "VeryLazy",
        lazy = false,
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

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("plugins.config.indent-blankline")
        end,
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
        "jay-babu/mason-null-ls.nvim",
        config = function()
            require("plugins.config.mason-null-ls")
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
        -- event = "VeryLazy",
        lazy = false,
        config = function()
            require("plugins.config.lspconfig")
        end,

        dependencies = {
            -- optional
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
            -- "ray-x/lsp_signature.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- ! order matters
            "lvimuser/lsp-inlayhints.nvim",
        },
    },

    {
        "lspcontainers/lspcontainers.nvim",
        -- INFO:
        enabled = false,
        event = "VeryLazy",
        dependencies = {
            "neovim/nvim-lspconfig",
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
        enabled = false,
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
        enabled = false,
        config = function()
            require("plugins.config.virtual-text")
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        enabled = false,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dapui").setup({})
        end,
    },

    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-G>", "copilot#Accept('')", {
                noremap = true,
                silent = true,
                expr = true,
                replace_keycodes = false,
            })
        end,
        -- enabled = false,
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.config.nvim-treesitter")
        end,
        build = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = true })
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

    {
        url = "https://gitlab.com/HiPhish/nvim-ts-rainbow2",
        enabled = false,
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        url = "https://codeberg.org/esensar/nvim-dev-container",
        enabled = false,
        event = "VeryLazy",
        config = function()
            require("plugins.config.dev-container")
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
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
        enabled = false,
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
