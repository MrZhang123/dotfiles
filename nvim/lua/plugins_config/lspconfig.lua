-- 要安装/启用的 LSP 列表
local installed = {'ts_ls', 'html', 'jsonls', 'gopls', 'cssls', 'cssmodules_ls'}

-- mason & mason-lspconfig 配置
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = installed,
    automatic_enable = {
        exclude = {'eslint'}
    }
})

-- 全局诊断快捷键
local opts = {
    silent = true
}
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({count = -1})
end, opts)
vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({count = 1})
end, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- LSP 附着后的 buffer 级快捷键
local on_attach = function(client, bufnr)
    local bufopts = {
        silent = true,
        buf = bufnr
    }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format {
            async = true
        }
    end, bufopts)

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- capabilities：开启 snippet 支持（尤其给 css/html/json 用）
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- 使用 Neovim 0.11 的新接口配置并启用各个 LSP
for _, lsp in ipairs(installed) do
    local config = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150
        }
    }

    vim.lsp.config(lsp, config)
    -- 真正启用这个 server
    vim.lsp.enable(lsp)
end

-- neovim diagnostic config
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = false
})

-- 悬停自动弹出诊断
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    group = vim.api.nvim_create_augroup("DiagnosticFloat", {clear = true}),
    callback = function()
        vim.diagnostic.open_float(nil, {focus = false})
    end
})
