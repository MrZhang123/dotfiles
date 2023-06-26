return {{
    "nvim-treesitter/nvim-treesitter", -- treesitter
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {"html", "css", "lua", "javascript", "typescript", "tsx", "go", "bash", "comment", "markdown"},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        },
        indent = {
            enable = true
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                node_incremental = 'grn',
                scope_incremental = 'grc',
                node_decremental = 'grm'
            }
        }
    },
    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
    end
}}
