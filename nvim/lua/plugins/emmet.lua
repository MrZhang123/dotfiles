vim.g.user_emmet_install_global = 0
vim.g.user_emmet_expandabbr_key = '<C-o>'
vim.api.nvim_command('autocmd FileType html,css,jsx,javascript.jsx,tsx,typescriptreact EmmetInstall')