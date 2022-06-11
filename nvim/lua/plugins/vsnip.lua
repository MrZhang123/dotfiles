vim.cmd [[
    let g:vsnip_filetypes = {}
    let g:vsnip_filetypes.javascriptreact = ['javascript', 'typescript']
    let g:vsnip_filetypes.typescriptreact = ['javascript', 'typescript']
    let g:vsnip_filetypes.typescript = ['javascript', 'typescript']
]]

-- Expand
vim.api.nvim_command(
    [[imap <expr> <C-e> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-e>']]
)
vim.api.nvim_command(
    [[imap <expr> <C-l> vsnip#available() ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
)
vim.api.nvim_command(
    [[smap <expr> <C-e> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-e>']]
)
vim.api.nvim_command(
    [[smap <expr> <C-l> vsnip#available() ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
)