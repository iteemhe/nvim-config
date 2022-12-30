-- examples for your init.lua

-- empty setup using defaults
-- require("nvim-tree").setup()

local config = {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false, -- should hidden files
    },
}

-- OR setup with some options
local nvim_tree = require("nvim-tree")
local map = vim.keymap.set
nvim_tree.setup(config)
local opts = { noremap = true, silent = true }

--NOTE: nvim-tree
map("n", "<C-b>", nvim_tree.toggle, opts)
map("n", "<C-n>", nvim_tree.focus, opts)
