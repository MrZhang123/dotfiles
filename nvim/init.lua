local try_require = require('common').try_require

try_require('options')

require("plugins_config.lazy")

-- options

-- packages
-- try_require('pack')

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

