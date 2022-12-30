local telescope = require("telescope")
local actions = require("telescope.actions")

local config = {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-d>"] = actions.close,
                ["<C-h>"] = "which_key",
                ["<ESC>"] = actions.close,
            },
            n = {
                ["<C-d>"] = actions.close,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            theme = "ivy",
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
        },

        -- "noice",
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
}

telescope.setup(config)

telescope.load_extension("ui-select")
-- telescope.load_extension("noice")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, opts)
map("n", "<leader>fg", builtin.live_grep, opts)
map("n", "<leader>fb", builtin.buffers, opts)
map("n", "<leader>fh", builtin.help_tags, opts)
map("n", "gd", builtin.lsp_definitions, opts)
map("n", "gr", builtin.lsp_references, opts)
map("n", "gc", builtin.lsp_outgoing_calls, opts)
