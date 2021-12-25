require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    },
    ensure_installed = {"html", "css", "lua", "javascript", "typescript", "tsx", "go", "bash", "comment"},
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
