" ---------------vim set-------------------
" in vim <Esc> , <Ctrl-c> and <Ctrl-[> have same effect , they all can enter normal modal

set re=1
set ttyfast
" set lazyredraw

set scrolloff=3
set noshowcmd
" splits to happen below
set splitbelow

" set synmaxcol=200

" set backspace can delete all the time
set backspace=indent,eol,start

" disable Vim bells sounds
set visualbell t_vb=
set t_Co=256
set encoding=utf-8
set t_RV=

" set vim to en
let $LANG = 'en_US'
set langmenu=en_US

" set vim use system clipboard (all delete and copy operation storage vim unnamed register)
set clipboard=unnamed

" set vim leader is ; default is \
let mapleader=';'

" set vim can scroll in item2
set mouse=a

" set directory that contain current file is current directory, ctrl-x-f can show directory reminder
set autochdir

" show line number
set number
set norelativenumber

" close vi compatibility model --rm
" set nocompatible

" close heighlight current line
set nocursorline

" close heighlight current column
" set nocursorcolumn

" open ruler
" set ruler

" set tab size
set tabstop=2

" automatic change tab to space when enter <Tab>
set expandtab

" set << and >> move size
set shiftwidth=2

" set <Backspace> delete space num
set softtabstop=2

" when insert the brackets , cursor jump to corresponding brackets brief
" set showmatch

" set code fold enable
" set foldenable

" set syntax fold
" disabled and use FastFold beacuse this set will have performance problem
" set foldmethod=syntax

" set not fold code when open file
" set foldlevelstart=99

" set command line number is 1
set cmdheight=1

" set status bar show (default is 1, not show)
" set laststatus=2

" set relative line number
" set relativenumber

" set matchpairs=(:),{:},[:]

" search result heighligh, when enter `:noh` in command line , clean heightlight
set hlsearch

" set search ignore case
set ignorecase

" if search have capital , use case for search
set smartcase

" set no swp files
set noswapfile

" no back up file
set nobackup

" Persistenstent undo
" set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=1000

" List autocomplete menu
" Use <C-d> to list all available
set wildmenu
set wildmode=full

set fileformats=unix,dos,mac
" set fenc=utf-8
" set fencs=utf-8
" set tenc=utf-8
if has("gui_running")
	" hidden left scroll line
	set guioptions-=L
	" hidden right scroll line
	set guioptions-=r
	" hidden bottom scroll line
	set guioptions-=b
	" set font
	set macligatures
	set guifont=Dank\ Mono:h18
  " set guifont=OperatorMono-Book:h18
  " set guifont=Fira\ Code:h18
	" set background opacity
	" set transparency=1
endif

" set tabsize for different files
if has("autocmd")
  autocmd FileType jsx,javascript setlocal ts=2 sts=2 sw=2
  autocmd FileType go setlocal ts=4 sts=4 sw=4
  " react snippets
  " autocmd FileType jsx,javascript.jsx UltiSnipsAddFiletypes javascript-es6-react.snippets
endif

" ----------------plugin----------------------

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] }
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
" Plug 'prettier/vim-prettier'
" Plug 'Chiel92/vim-autoformat'
" Plug 'w0rp/ale'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
" Plug 'Yggdroot/indentLine'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'elzr/vim-json', { 'for': ['markdown', 'json'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" rely on ctags, use new ctags universal-ctags , https://github.com/universal-ctags/ctags
" brew install --HEAD --with-jansson universal-ctags/universal-ctags/universal-ctags
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

" set theme

syntax on " use plugin
syntax enable " use code heighlight

if has("gui_running")
  " colorscheme solarized
  colorscheme desert
else
  colorscheme desert
  " colorscheme solarized
endif
set background=dark

" CtrlP
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
" let g:ctrlp_custom_ignore = { 'dir': 'build$\|node_modules$' }
" Ignore files in .gitignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" use rg with ctrlp
" if executable('rg')
  " set grepprg=rg\ --color=never
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " let g:ctrlp_use_caching = 0
" endif

" airline
set laststatus=2
" let g:airline_theme='powerlineish'
" let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 0

" formate buffer name
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<c-n>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<c-k>']
" disable diagnostics ui

" ycm disable diagnostic
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

let g:ycm_error_symbol = '💩'
let g:ycm_warning_symbol = '👻'
" Ctrl-z trigger reminder
" let g:ycm_key_invoke_completion = '<c-z>'
" automatic reminder
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \ 'cs,lua,javascript': ['re!\w{2}'],
  \ }
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" set vim pop color
highlight PMenu ctermfg=55 ctermbg=15 guifg=purple4 guibg=white

highlight PMenuSel ctermfg=15 ctermbg=0 guifg=white guibg=black

" emmet-vim
" set file type that can sue emmet
autocmd FileType html,css,jsx,javascript.jsx EmmetInstall
" set trigger key
let g:user_emmet_expandabbr_key='<C-o>'
" let g:user_emmet_leader_key='<Ctrl>'

let g:user_emmet_mode='a'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
" imap <expr> <tab> emmet#expandAbbrIntelligent('\<tab>')

" vim-jsx
let g:jsx_ext_required = 0

" scss-syntax
" au FileType scss set iskeyword+=-
" au BufRead,BufNewFile *.scss set filetype=scss.css

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '⎸'

" The NERDTree
" set Ctrl-n to open NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" NERDTreeIgnore
let NERDTreeIgnore = ['\.swp$', '.DS_Store']
" show hidden file (eg: .gitignore)
let NERDTreeShowHidden=1

" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
" suport react jsx
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" vim-markdown
" use math extensions
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['js=javascript', 'go=golang', 'py=python']

" vim-json
" disable concealing of double quotes
" set conceallevel=0
let g:vim_json_syntax_conceal = 0

" ale for linter
" let g:ale_fixers = ['eslint', 'prettier']
" let g:ale_sign_error = '👊'
" let g:ale_sign_warning = '🎃'
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
" let g:ale_open_list = 1
" let g:ale_fix_on_save = 1

" vim-signify
" let g:signify_vcs_list = [ 'git', 'hg' ]

" vim Ultisnips keyborad change
let g:UltiSnipsExpandTrigger='<c-e>'
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" fzf
" fzf use rg search config
let g:fzf_layout = { 'down': '~70%' }
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5 } }
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   "rg --column --line-number --no-heading --color=always --smart-case "
      \   .(len(<q-args>) > 0 ? <q-args>: '""'),
      \   1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \   : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" visa tagbar
" disable icon , because need special font
let g:vista#renderer#enable_icon = 0
let g:vista_sidebar_width = 50

" vim-fugitive
let g:fugitive_pty = 0

" ---------------vim keyboard redefine-------------
" redefine code fold key
" code fold
" nnoremap <S-n> zc
" nnoremap <S-m> zo

" use ctrl-j instead of J
nnoremap <C-j> J

" jump list (previous, next) (<Tab> and <Ctrl-i> is same in vim , so use <Ctrl-l> replace <Ctrl-i> for jump list)
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

" move current line
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" set indentation line key , use in Normal and Visual Modal
nnoremap <tab> V>
nnoremap <S-tab> V<
vnoremap <tab> >gv
vnoremap <S-tab> <gv

" set control buffer
nnoremap <silent> <leader>d :bd<CR> " close buffer
nnoremap <silent> <S-h> :bp<CR> " pre buffer
nnoremap <silent> <S-l> :bn<CR> " next buffer

" set control tabs
nnoremap <silent> <leader>tn :tabnew<CR>
 " gt
nnoremap <silent> <leader>th :tabp<CR>
" gT
nnoremap <silent> <leader>tl :tabn<CR>
nnoremap <silent> <leader>tc :tabclose<CR>

" set save shortcut key
nnoremap <silent> <leader>w :w<CR>

" set reloading vim when change .vimrc
nnoremap <silent> <leader>r :source ~/.vimrc<CR>

" YCM GoTo key（jump list pre use <Ctrl-h> , next is <Ctrl-l>）
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR> " go to declar
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>  " go to definit
nnoremap <leader>g :YcmCompleter GoTo<CR>             " tries to perform the 'most sensible' GoTo operation it can
nnoremap <leader>tp :YcmCompleter GoToType<CR>        " go to type

" fzf vim
nnoremap  <silent> <Leader>rg :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <C-p> :Files<CR>
" nnoremap <silent> <C-p> :Files <C-R>=expand('%:h')<CR><CR>

" visa tagbar
nnoremap <silent><leader><C-n> :Vista!!<CR>
