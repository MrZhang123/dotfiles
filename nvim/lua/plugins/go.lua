require('go').setup({
	comment_placeholder = '🥳 ',
	lsp_cfg = false,
})
require("go.format").goimport()  -- goimport + gofmt

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
