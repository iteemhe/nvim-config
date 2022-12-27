-- vim.opt.compatible = false
-- vim.opt.encoding = "utf-8"

-- vim.opt.indentkeys

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
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
-- vim.cmd.colorscheme("onedark")

--NOTE: nvim-tree

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
