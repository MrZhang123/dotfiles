local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local try_require = require('common').try_require

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- options
try_require('options')

-- packages
-- try_require('pack')
require("lazy").setup("plugins")

require('impatient').enable_profile()

-- mappings
try_require('mappings')

-- plugins
try_require('plugins_config.emmet')
try_require('plugins_config.lspconfig')

try_require('plugins_config.telescope')
try_require('plugins_config.toggleterm')
try_require('plugins_config.vsnip')
try_require('plugins_config.gonvim')

-- try_require('plugins.gitsigns')
-- try_require('plugins.nvimgo')
-- try_require('plugins.pears')
-- try_require('plugins.prettier')
-- try_require('plugins.rust')
-- try_require('plugins.vimwiki')

