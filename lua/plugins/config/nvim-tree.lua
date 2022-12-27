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
require("nvim-tree").setup(config)
