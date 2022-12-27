local path = vim.loop.cwd() .. "/.git"
local ok, _ = vim.loop.fs_stat(path)
if ok then
	require("gitsigns").setup({})
end
