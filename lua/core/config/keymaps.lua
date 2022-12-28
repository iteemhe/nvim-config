local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--NOTE: basic maps
map("!", "<C-h>", "<Left>", opts)
map("!", "<C-j>", "<Down>", opts)
map("!", "<C-k>", "<Up>", opts)
map("!", "<C-l>", "<Right>", opts)

map("n", "<Leader>s", ":w<CR>", opts)
map("n", "<Leader>w", ":w<CR>", opts)
map("n", "<Leader>x", ":x<CR>", opts)
map("n", "<Leader>e", ":q!<CR>", opts)
map("n", "<Leader>b", ":bd<CR>", opts)

map("x", "<Leader>y", '"+y', opts)

map("n", "<Leader>ya", ":%y+<CR>", opts)
map("n", "<Leader>yy", '"+yy', opts)
map("n", "<Leader>p", '"+p', opts)

-- code actions
map("n", "<Leader>a", vim.lsp.buf.code_action, opts)

--NOTE: nvim-tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
map("n", "<C-n>", ":NvimTreeFocus<CR>", opts)

--NOTE: barbar

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

--NOTE: telescope
--
-- local builtin = require("telescope.builtin")
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "gd", ":Telescope lsp_definitions<CR>", opts)
