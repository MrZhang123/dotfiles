return {{
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
        pre_hook = function(ctx)
            local ok, parser = pcall(vim.treesitter.get_parser, 0)
            -- Neovim 0.12 can return nil here when no parser is installed.
            if ok and parser ~= nil then
                return nil
            end

            local ft = require('Comment.ft')
            return ft.get(vim.bo.filetype, ctx.ctype) or vim.bo.commentstring
        end,
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
    config = function(_, opts)
        require("Comment").setup(opts)
    end
}}
