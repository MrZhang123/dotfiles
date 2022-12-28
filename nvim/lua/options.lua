local cmd = vim.cmd
local opt = vim.opt
local has = vim.fn.has

cmd('filetype plugin indent on')
cmd('syntax enable')

-- systematic
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = {'utf-8'}
opt.backup = false -- no .bak
opt.swapfile = false -- no .swap
opt.undofile = true -- use undo file
opt.updatetime = 300 -- time (in ms) to write to swap file
opt.history = 200 -- save vim commond list max

-- code fold
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- set not fold code when open file
vim.wo.foldlevel = 99

-- window
opt.scrolloff = 3 -- 保持在光标上下最少行数
-- opt.showcmd = false
opt.number = true
opt.relativenumber = true

opt.expandtab = true -- automatic change tab to space when enter <Tab>
opt.tabstop = 2 -- set tab size
opt.softtabstop = 2 -- set <Backspace> delete space num
opt.autoindent = true -- auto indent for new line
opt.shiftwidth = 2 -- set << and >> move size

-- opt.cursorline = true -- heighlight current line
-- opt.cursorcolumn = true

-- editing
vim.g.mapleader = ';' -- vim mapleader ;
opt.guicursor='n-v-c-sm:block,i-ci-ve:ver40,r-cr-o:hor20' -- 设置各个模式下光标样式,设置为空，则全部为block
-- opt.guicursor='' -- 设置各个模式下光标样式,设置为空，则全部为block

opt.autochdir = true -- set directory that contain current file is current directory, ctrl-x-f can show directory reminder
-- opt.whichwrap = 'b,s,<,>,[,]' -- cursor is able to move from end of line to next line
opt.backspace = {'indent', 'eol', 'start'} -- set backspace can delete all the time
opt.clipboard = 'unnamed' -- set vim use system clipboard (all delete and copy operation storage vim unnamed register)

opt.mouse = 'a'
opt.ruler = true -- show ruler line
opt.cmdheight = 1 -- height of :command line
opt.hlsearch = true -- highlight search
opt.ignorecase = true -- set search ignore case
opt.smartcase = true -- if search have capital , use case for search

opt.wildmenu = true -- wildmenu, auto complete for commands
opt.wildmode = {'longest', 'full'}
-- opt.showmatch = true -- show bracket match

-- if not has('gui_running') then
    -- vim.cmd("echon 'not gui run'")
    -- opt.t_Co = 256
    -- set macligatures
    -- set guifont=Dank\ Mono:h16
-- end
-- vim.cmd("echon 'gui run'")

-- options: default,desert,evening
cmd('colorscheme default')
-- cmd('colorscheme tokyonight')
-- opt.background = 'dark'

cmd('highlight PMenu ctermfg=34 ctermbg=232 guifg=green3 guibg=black')
cmd('highlight PMenuSel ctermfg=15 ctermbg=242 guifg=white guibg=gray')

cmd('hi NormalColor guifg=Black guibg=Green3 ctermbg=46 ctermfg=0')
cmd('hi InsertColor guifg=Black guibg=Yellow ctermbg=51 ctermfg=0')
cmd('hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0')
cmd('hi VisualColor guifg=Black guibg=Orange ctermbg=202 ctermfg=0')

-- neovim 0.8+
-- vim.o.ch = 0
-- vim.o.ls = 0

if has('termguicolors') then
    cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
    cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
    opt.termguicolors = true
end
