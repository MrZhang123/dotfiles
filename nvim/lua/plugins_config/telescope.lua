-- require('telescope').load_extension('session-lens')
-- require('telescope').load_extension('heading')
local set_keymap = require('../common').set_keymap

local function get_git_root()
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(current_file, ":h")
    local cmd = string.format("git -C %s rev-parse --show-toplevel", vim.fn.escape(current_dir, " "))
    local git_root = vim.fn.systemlist(cmd)[1]
    return git_root
end

local function cd_to_git_root()
    local git_root = get_git_root()
    if git_root then
        vim.cmd("cd " .. git_root)
        print("Changed to: " .. git_root)
    else
        print("Not in a git repository")
    end
end

set_keymap('n', '<c-p>', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>')

set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>')

set_keymap('n', '<leader>fd', '<cmd>Telescope git_files<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set_keymap('n', '<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>')
set_keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
set_keymap('n', '<leader>fm', '<cmd>Telescope heading<cr>')

-- Change to current file's directory
set_keymap("n", "<leader>.", ":exec 'cd' . expand('%:p:h')<CR>", {
    noremap = true,
    silent = true
})

-- Change directory to git root
vim.keymap.set("n", "<leader>cd", cd_to_git_root, {
    noremap = true,
    silent = false,
    desc = "Change directory to git root"
})

-- set theme
require('telescope').setup({
    defaults = require('telescope.themes').get_ivy({})
})
