-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
--[[
require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})
]]

-- Set up lspconfig.
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

--[[
require("lsp_signature").setup({
    -- log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
    debug = true,
    hint_enable = true,
    handler_opts = { border = "single" },
    max_width = 80,
});
]]

-- then setup your lsp server as usual
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig').sumneko_lua.setup {
--     capabilities = capabilities
-- }

-- Lua
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                enable = true,
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- C/C++
lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion=never",
        "--pch-storage=memory",
        "--ranking-model=decision_forest",
        "--limit-references=0",
        "--limit-results=0",
        "--pretty",
        "-j=4",
    },
})

-- Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})

-- Haskell
lspconfig.hls.setup({
    capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
    capabilities = capabilities,
    python = {
        analysis = {
            autoImportCompletion = true,
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "strict",
            useLibraryCodeForTypes = true,
        },
    },
})

-- Markdown
lspconfig.marksman.setup({
    capabilities = capabilities,
})
