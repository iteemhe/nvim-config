local opt = vim.opt
local g = vim.g

opt.compatible = false
opt.encoding = "utf-8"

-- opt.indentkeys

opt.cursorline = true
opt.cursorcolumn = true
opt.wrap = false
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.smarttab = true

opt.hlsearch = true
opt.smartcase = true

opt.number = true
opt.scrolloff = 5
opt.sidescrolloff = 5

opt.signcolumn = "yes"

require("better_escape").setup({
    mapping = { "jk" }, -- a table with mappings to use
    -- timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    timeout = 200,
    clear_empty_lines = true, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result every time
    -- example(recommended)
    -- keys = function()
    --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    -- end,
})

require("trim").setup({
    -- if you want to ignore markdown file.
    -- you can specify filetypes.
    disable = { "markdown" },

    -- if you want to remove multiple blank lines
    patterns = {
        [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
    },
})
