local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.clang_format, -- C/C++ formatter
	null_ls.builtins.formatting.stylua, -- Lua format
	null_ls.builtins.formatting.black, -- Python formatter
	null_ls.builtins.formatting.prettier,
	--	null_ls.builtins.formatting.codespell,
	-- null_ls.builtins.formatting.beautysh,

	null_ls.builtins.diagnostics.todo_comments,
	null_ls.builtins.diagnostics.trail_space,
	-- null_ls.builtins.diagnostics.codespell,

	null_ls.builtins.diagnostics.cppcheck,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.diagnostics.zsh,
	null_ls.builtins.diagnostics.tsc,

	-- null_ls.builtins.completion.spell,
	null_ls.builtins.completion.luasnip,
}

-- signla nvim to update in insert mode
--[[ vim.diagnostic.config.update_in_insert = true
vim.diagnostic.config({
    update_in_insert = true,
})
]]

local format_on_save = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	temp_dir = "/tmp",
	update_in_insert = false,
	sources = sources,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = format_on_save, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = format_on_save,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
