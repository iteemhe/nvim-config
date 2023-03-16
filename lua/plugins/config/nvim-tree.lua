-- examples for your init.lua

-- empty setup using defaults
-- require("nvim-tree").setup()

local config = {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        -- mappings = { list = { { key = "u", action = "dir_up" }, }, },
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
local api = require("nvim-tree.api")
local map = vim.keymap.set
nvim_tree.setup(config)
local opts = { noremap = true, silent = true }

--NOTE: nvim-tree
map("n", "<C-b>", api.tree.toggle, opts)
map("n", "<C-n>", api.tree.focus, opts)

local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
