local parsers = {"html", "css", "lua", "javascript", "typescript", "tsx", "go", "bash", "comment", "markdown"}
local filetypes = {"html", "css", "lua", "javascript", "typescript", "typescriptreact", "go", "sh", "bash", "markdown"}

return {{
    "nvim-treesitter/nvim-treesitter", -- treesitter
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup()
        treesitter.install(parsers)

        if vim.treesitter.language and vim.treesitter.language.register then
            vim.treesitter.language.register("bash", {"sh", "bash"})
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function()
                pcall(vim.treesitter.start)
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        })
    end
}}
