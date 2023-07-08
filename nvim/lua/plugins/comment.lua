return {{
    "numToStr/Comment.nvim",
    lazy = false,
    -- keys = {{
    --     '<leader><Space>',
    --     function()
    --         require("Comment.api").toggle.linewise.current()
    --     end,
    --     silent = true,
    --     noremap = true,
    --     mode = 'n'
    -- }, {
    --     '<leader>c<Space>',
    --     function()
    --         require("Comment.api").toggle.blockwise.current()
    --     end,
    --     silent = true,
    --     noremap = true,
    --     mode = 'n'
    -- }, {
    --     '<leader><Space>',
    --     function()
    --         require("Comment.api").toggle.linewise(vim.fn.visualmode())
    --     end,
    --     silent = true,
    --     noremap = true,
    --     mode = 'v'
    -- }, {
    --     '<leader>c<Space>',
    --     function()
    --         require("Comment.api").toggle.blockwise(vim.fn.visualmode())
    --     end,
    --     silent = true,
    --     noremap = true,
    --     mode = 'v'
    -- }},
    opts = {
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gbc'
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = 'gc',
            ---Block-comment keymap
            block = 'gb'
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment on the line above
            above = 'gcO',
            ---Add comment on the line below
            below = 'gco',
            ---Add comment at the end of line
            eol = 'gcA'
        }
    },
    config = function()
        require("Comment").setup()
    end
}}
