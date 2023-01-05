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

local on_attach = function(client, bufnr) end

-- Lua
lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
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
    on_attach = on_attach,
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
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Haskell
lspconfig.hls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
    on_attach = on_attach,
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
    on_attach = on_attach,
    capabilities = capabilities,
})
