return {{
    "numToStr/Comment.nvim",
    lazy = false,
    keys = {{
        '<leader><Space>',
        function()
            require("Comment.api").toggle.linewise.current()
        end,
        silent = true,
        noremap = true,
        mode = 'n'
    }, {
        '<leader>c<Space>',
        function()
            require("Comment.api").toggle.blockwise.current()
        end,
        silent = true,
        noremap = true,
        mode = 'n'
    }, {
        '<leader><Space>',
        function()
            require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        silent = true,
        noremap = true,
        mode = 'v'
    }, {
        '<leader>c<Space>',
        function()
            require("Comment.api").toggle.blockwise(vim.fn.visualmode())
        end,
        silent = true,
        noremap = true,
        mode = 'v'
    }},
    config = function()
        require("Comment").setup()
    end
}}
