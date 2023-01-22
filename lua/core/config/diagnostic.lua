--[[
local config = {
    float = {
        source = "always", -- Or "if_many"
    },
}

vim.diagnostic.config(config)
]]

-- keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<Leader>df", vim.diagnostic.open_float, opts)
