local buf_set_keymap = require('../common').buf_set_keymap
local set_keymap = require('../common').set_keymap

require('toggleterm').setup({
	size= 20,
    open_mapping = [[<C-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal'
})

function _G.set_terminal_keymaps()
    local opts = {
        noremap = true
    }
    buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]])
    -- buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]])
    buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]])
    buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]])
    buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]])
    buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]])
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

set_keymap('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
