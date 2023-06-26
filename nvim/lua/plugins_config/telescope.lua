-- require('telescope').load_extension('session-lens')
-- require('telescope').load_extension('heading')

local set_keymap = require('../common').set_keymap

set_keymap(
    'n',
    '<c-p>',
    '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>'
)

set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>')

set_keymap('n', '<leader>fd', '<cmd>Telescope git_files<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set_keymap('n', '<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>')
set_keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
set_keymap('n', '<leader>fm', '<cmd>Telescope heading<cr>')

-- set theme
require('telescope').setup({
    defaults = require('telescope.themes').get_ivy({ }),
})
