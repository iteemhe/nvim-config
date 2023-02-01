local api = vim.api
-- vim.opt.compatible = false
-- vim.opt.encoding = "utf-8"

-- vim.opt.indentkeys

-- vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.hlsearch = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0

vim.opt.shortmess:append("I") -- check :h shortmess
-- vim.cmd.colorscheme("onedark")

--NOTE: nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--NOTE: barbar
-- reset highlight
-- api.nvim_set_hl(0, "BarbecueSeparator", {})
--api.nvim_set_hl(0, "BarbecueEllipsis", {})

-- treesitter-context
api.nvim_set_hl(0, "TreesitterContextBottom", { underdouble = true, sp = "purple" })

-- diagnostic signs
local signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignHint", text = "\u{fbe6} " },
    { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- indent-blankline
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
