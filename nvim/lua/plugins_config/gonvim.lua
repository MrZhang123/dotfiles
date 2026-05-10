-- Run gofmt + goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("GoFormat", {clear = true}),
    pattern = "*.go",
    callback = function()
        pcall(function()
            require('go.format').goimport()
        end)
    end
})
