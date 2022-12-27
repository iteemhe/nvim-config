local config = {
    -- create_autocmd = false, -- prevent barbecue from updating itself automatically
    -- attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
    show_modified = true,
    exclude_filetype = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "qf",
    },
}

require("barbecue").setup(config)
