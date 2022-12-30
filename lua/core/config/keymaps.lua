local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--NOTE: basic maps
map("!", "<C-h>", "<Left>", opts)
map("!", "<C-j>", "<Down>", opts)
map("!", "<C-k>", "<Up>", opts)
map("!", "<C-l>", "<Right>", opts)

map("n", "<Leader>s", ":silent w<CR>", opts)
map("n", "<Leader>w", ":silent w<CR>", opts)
map("n", "<Leader>sw", ":silent w !pkexec tee %<CR>", opts)

map("n", "<Leader>x", ":x<CR>", opts)
map("n", "<Leader>e", ":q!<CR>", opts)
-- map("n", "<Leader>b", ":bd<CR>", opts)

map("x", "<Leader>y", '"+y', opts)
map("n", "<Leader>ya", ":%y+<CR>", opts)
map("n", "<Leader>yy", '"+yy', opts)
map("n", "<Leader>p", '"+p', opts)

-- code actions
map("n", "<Leader>a", vim.lsp.buf.code_action, opts)
