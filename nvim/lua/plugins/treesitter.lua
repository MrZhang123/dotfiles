require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ensure_installed = {"html", "css", "lua", "javascript", "typescript", "tsx", "go", "bash", "comment", "markdown"},
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
})
