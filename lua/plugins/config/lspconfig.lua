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
-- lspconfig.clangd.setup {
--     capabilities = capabilities,
--     cmd = {
--         "clangd",
--         "--clang-tidy",
--         "--header-insertion=never",
--         "--pch-storage=memory",
--         "--ranking-model=decision_forest",
--         "--limit-references=0",
--         "--limit-results=0",
--         "--pretty",
--         "-j=4"
--     }
-- }
require("clangd_extensions").setup({
    server = {
        -- options to pass to nvim-lspconfig
        -- i.e. the arguments to require("lspconfig").clangd.setup({})
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
            -- turn off placeholders for lsp_signature
            "--function-arg-placeholders=0",
        },
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true, -- set to fales due to lsp-inlayhints
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            --[[ These are unicode, should be available in any font
            role_icons = {
            type = "🄣",
            declaration = "🄓",
            expression = "🄔",
            statement = ";",
            specifier = "🄢",
            ["template argument"] = "🆃",
            },
            kind_icons = {
            Compound = "🄲",
            Recovery = "🅁",
            TranslationUnit = "🅄",
            PackExpansion = "🄿",
            TemplateTypeParm = "🅃",
            TemplateTemplateParm = "🅃",
            TemplateParamObject = "🅃",
            }, ]]

            -- These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },

            highlights = {
                detail = "Comment",
            },
        },
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    },
})

-- Rust
lspconfig.rust_analyzer.setup({
    cmd = {
        "/home/jiahaohe/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer",
    },
})

-- Haskell
lspconfig.hls.setup({})

-- Python
lspconfig.pyright.setup({
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
lspconfig.marksman.setup({})
