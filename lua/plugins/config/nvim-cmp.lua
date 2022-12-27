-- Set up nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

local formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
        local kind = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 30,
            ellipsis_char = "...",
            -- preset = "default",
            preset = "codicons",
        })(entry, vim_item)

        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. strings[1] .. " "
        kind.menu = "    (" .. strings[2] .. ")"
        return kind
    end,
}

local config = {
    completion = { completeopt = "menu,menuone,noinsert" },
    formatting = formatting,
    experimental = { ghost_text = true },
    view = {
        entries = { name = "custom", selection_order = "near_cursor" },
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = {
            -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),

        ["<C-j>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
                -- elseif cmp.has_words_before() then
                -- cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-k>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = "buffer" },
        -- hope we have path completion
        { name = "path" },
    }),
}

cmp.setup(config)

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = "buffer" },
    }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    -- do not select the first one
    completion = { completeopt = "menu,menuone,noselect,noinsert" },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    -- do not select the first one
    completion = { completeopt = "menu,menuone,noselect,noinsert" },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})
require("luasnip.loaders.from_vscode").load()

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- -- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig').sumneko_lua.setup {
--     capabilities = capabilities
-- }
