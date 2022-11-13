local set_keymap = require('common').set_keymap
local nvim_set_keymap = require('common').nvim_set_keymap

-- command

-- " Have j and k navigate visual lines rather than logical ones
set_keymap('n', 'j', 'gj')
set_keymap('n', 'k', 'gk')

set_keymap('n', '<leader>w', '<cmd>w<cr>')
set_keymap('n', '<C-j>', 'J')

-- jump list (previous, next) (<Tab> and <Ctrl-i> is same in vim , so use <Ctrl-l> replace <Ctrl-i> for jump list)
set_keymap('n', '<C-l>', '<C-i>')
set_keymap('n', '<C-h>', '<C-o>')

-- code fold
set_keymap('n', '<leader>n', 'zc')
set_keymap('n', '<leader>m', 'zo')

-- code move
set_keymap('n', '<S-j>', ':m .+1<CR>==')
set_keymap('n', '<S-k>', ':m .-2<CR>==')
set_keymap('v', '<S-j>', ':m \'>+1<CR>gv=gv')
set_keymap('v', '<S-k>', ':m \'<-2<CR>gv=gv')

set_keymap('n', '<tab>', 'V>')
set_keymap('n', '<S-tab>', 'V<')
set_keymap('v', '<tab>', '>gv')
set_keymap('v', '<S-tab>', '<gv')

-- buffer
local buffer_opts = {
	noremap = true,
	silent = true
}
nvim_set_keymap('n', '<leader>d', '<cmd>bd<cr>', buffer_opts) -- close buffer
nvim_set_keymap('n', '<S-h>', '<cmd>bp<cr>', buffer_opts) -- pre buffer
nvim_set_keymap('n', '<S-l>', '<cmd>bn<cr>', buffer_opts) -- next buffer
