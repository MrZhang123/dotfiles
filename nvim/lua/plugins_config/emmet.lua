-- <c-y>,
vim.g.user_emmet_install_global = 0
-- vim.g.user_emmet_leader_key='<Ctrl>'
-- vim.g.user_emmet_expandabbr_key = '<Tab>'
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("EmmetInstall", {clear = true}),
    pattern = {"html", "css", "javascriptreact", "jsx", "javascript.jsx", "tsx", "typescriptreact"},
    command = "EmmetInstall"
})
