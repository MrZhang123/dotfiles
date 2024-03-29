return {{
    "hrsh7th/nvim-cmp", -- completion
    lazy = false,
    dependencies = {"hrsh7th/cmp-nvim-lsp", -- cmp lsp
    "hrsh7th/cmp-nvim-lua", -- cmp lua vim api
    "hrsh7th/cmp-buffer", -- cmp buffer
    "hrsh7th/cmp-path", -- cmp path
    "hrsh7th/cmp-vsnip" -- cmp vsnip integration
    },
    opts = function()
        local cmp = require("cmp")
        return {
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end
            },
            mapping = {
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- ['<C-e>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                })
            },
            sources = {{
                name = 'nvim_lsp'
            }, {
                name = 'vsnip'
            }, {
                name = 'buffer'
            }, {
                name = 'path'
            }}
        }
    end
}}

-- Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
-- Level numbers begin with "TRACE" at 0
-- vim.lsp.set_log_level("off")
