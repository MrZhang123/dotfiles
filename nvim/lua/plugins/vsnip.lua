vim.g.vsnip_snippet_dirs = {'/Users/zhangyi/.config/nvim/snippets', '/Users/zhangyi/.config/nvim/snippets/javascript'}

-- Expand
vim.api.nvim_command(
    [[imap <expr> <C-e> vsnip#expandable() ? '<Plug>(vsnip-expand-or-jump)' : '<C-e>']]
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
