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

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.config.nvim-treesitter")
        end,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
    },
}

local opts = {
    defaults = {
        lazy = false,
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
