return {{
    "lewis6991/impatient.nvim",
    lazy = false
}, -- lib
{
    "nvim-lua/plenary.nvim",
    lazy = false
}, {
    "nvim-lua/popup.nvim",
    lazy = false
}, -- view
{
    "wincent/ferret", -- find and replace
    lazy = false
}, {
    "editorconfig/editorconfig-vim", -- editorconfig support
    lazy = false
}, {
    "tpope/vim-fugitive", -- git signs
    lazy = false
}, -- file
{
    "nvim-telescope/telescope.nvim", -- fuzzy picker
    lazy = false
}, {
    "crispgm/telescope-heading.nvim", -- markdown heading
    lazy = false
}, {
    "akinsho/toggleterm.nvim", -- terminal
    lazy = false
}, -- edit
{
    "psliwka/vim-smoothie", -- smoothy scroll
    lazy = false
}, {
    "tpope/vim-surround", -- toggle surround
    lazy = false
}, {
    "tpope/vim-abolish",
    lazy = false
}, {
    "steelsojka/pears.nvim", -- auto symbol pairs
    lazy = false,
    config = function()
        require("pears").setup()
    end
}, -- language	
{
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
}, {
    "williamboman/mason-lspconfig.nvim",
    lazy = false
}, {
    "neovim/nvim-lspconfig", -- lsp client config
    lazy = false
}, {
    "hrsh7th/vim-vsnip", -- completion
    lazy = false,
    dependencies = {{
        "rafamadriz/friendly-snippets",
        dependencies = "vim-vsnip"
    }}
}, {
    "solarnz/thrift.vim",
    ft = 'thrift',
    lazy = true
}, {
    "ray-x/go.nvim",
    ft = 'go',
    config = function()
        require('go').setup({})
    end,
    lazy = true
}, {
    "mattn/emmet-vim",
    lazy = false
}}
