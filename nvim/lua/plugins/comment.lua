local nvim_set_keymap = require('../common').nvim_set_keymap
local opts = {
    noremap = true,
    silent = true,
}

-- comment current line

nvim_set_keymap('n', '<leader><Space>', ':lua require("Comment.api").toggle.linewise.current()<cr>', opts)
nvim_set_keymap('n', '<leader>c<Space>', ':lua require("Comment.api").toggle.blockwise.current()<cr>', opts)

-- comment current region in visual mode
-- Linewise toggle
nvim_set_keymap('v', '<leader><Space>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
-- Blockwise toggle using
nvim_set_keymap('v', '<leader>c<Space>', ':lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>', opts)