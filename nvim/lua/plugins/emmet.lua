vim.g.user_emmet_install_global = 0
-- vim.g.user_emmet_leader_key='<Ctrl>'
-- vim.g.user_emmet_expandabbr_key = '<Tab>'
vim.api.nvim_command('autocmd FileType html,css,javascriptreact,jsx,javascript.jsx,tsx,typescriptreact EmmetInstall')