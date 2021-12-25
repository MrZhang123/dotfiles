local M = {}

--- try requiring a submodule and do not crash all the configs
function M.try_require(name)
    local ok, error = pcall(require, name)
    if not ok then
        local msg = string.format(
            'config error: `%s`', error)
        vim.api.nvim_echo({{'init.lua', 'ErrorMsg'}, {' ' .. msg}}, true, {})
    end
end

---@param mode string 'n','i','v','c'
---@param from string
---@param to string

function M.set_keymap(mode, from, to)
    local opts = {
        noremap = true,
        silent = false
    }
    vim.api.nvim_set_keymap(mode, from, to, opts)
end

function M.nvim_set_keymap(mode, from, to, opts)
    vim.api.nvim_set_keymap(mode, from, to, opts)
end

function M.buf_set_keymap(buffer, mode, from, to)
    local opts = {
        noremap = true
    }
    vim.api.nvim_buf_set_keymap(buffer, mode, from, to, opts)
end

return M
