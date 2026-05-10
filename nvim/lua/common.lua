local M = {}

local function normalize_keymap_opts(opts)
    opts = vim.tbl_extend("force", {}, opts or {})

    if opts.noremap ~= nil then
        opts.remap = not opts.noremap
        opts.noremap = nil
    end

    if opts.buffer ~= nil and opts.buf == nil then
        opts.buf = opts.buffer
        opts.buffer = nil
    end

    return opts
end

--- try requiring a submodule and do not crash all the configs
function M.try_require(name)
    local ok, error = pcall(require, name)
    if not ok then
        local msg = string.format(
            'config error: `%s`', error)
        vim.api.nvim_echo({{'init.lua', 'ErrorMsg'}, {' ' .. msg}}, true, {})
    end
end

---@param mode string|string[] 'n','i','v','c'
---@param from string
---@param to string

function M.set_keymap(mode, from, to, opts)
    opts = normalize_keymap_opts(vim.tbl_extend("force", {
        remap = false,
        silent = false
    }, opts or {}))
    vim.keymap.set(mode, from, to, opts)
end

function M.nvim_set_keymap(mode, from, to, opts)
    opts = normalize_keymap_opts(opts)
    vim.keymap.set(mode, from, to, opts)
end

function M.buf_set_keymap(buffer, mode, from, to)
    local opts = {
        remap = false,
        buf = buffer
    }
    vim.keymap.set(mode, from, to, opts)
end

return M
