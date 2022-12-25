local map = vim.api.nvim_set_keymap

map("i", "<C-h>", "<Left>", { silent = true })
map("i", "<C-j>", "<Down>", { silent = true })
map("i", "<C-k>", "<Up>", { silent = true })
map("i", "<C-l>", "<Right>", { silent = true })

map("c", "<C-h>", "<Left>", { silent = true })
map("c", "<C-j>", "<Down>", { silent = true })
map("c", "<C-k>", "<Up>", { silent = true })
map("c", "<C-l>", "<Right>", { silent = true })

map("n", "<Leader>s", ":w<CR>", { silent = true })
map("n", "<Leader>w", ":w<CR>", { silent = true })
map("n", "<Leader>x", ":x<CR>", { silent = true })
map("n", "<Leader>e", ":q!<CR>", { silent = true })
map("n", "<Leader>b", ":bd<CR>", { silent = true })

map("x", "<Leader>y", '"+y', { silent = true })

map("n", "<Leader>ya", ":%y+<CR>", { silent = true })
map("n", "<Leader>yy", '"+yy', { silent = true })
map("n", "<Leader>p", '"+p', { silent = true })
