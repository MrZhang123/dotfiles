" ---------------vim set-------------------
" in vim <Esc> , <Ctrl-c> and <Ctrl-[> have same effect , they all can enter normal modal

" set vim to en
let $LANG = 'en_US'
set langmenu=en_US

" set vim use system clipboard (all delete and copy operation storage vim unnamed register)
set clipboard=unnamed

" set vim leader is ; default is \
let mapleader=";"

" set vim can scroll in item2
set mouse=a

" set directory that contain current file is current directory, ctrl-x-f can show directory reminder
set autochdir

" show line number
set number

" close vi compatibility model
set nocompatible

" heighlight current line
set cursorline

" heighlight current column
set cursorcolumn

" open ruler
set ruler

" set tab size
set tabstop=4

" automatic change tab to space when enter <Tab>
set expandtab

" set << and >> move size
set shiftwidth=4

" set <Backspace> delete space num
set softtabstop=4

" when insert the brackets , cursor jump to corresponding brackets brief
set showmatch

" set code fold enable
set foldenable

" set syntax fold
set foldmethod=syntax

" set not fold code when open file
set foldlevelstart=99

" set command line number is 1
set cmdheight=1

" set status bar show (default is 1, not show)
set laststatus=2

" set relative line number
" set relativenumber

" set matchpairs=(:),{:},[:]

" search result heighligh, when enter `:noh` in command line , clean heightlight
set hlsearch

" set search ignore case(大小写)
set ignorecase

" if search have capital , use case for search
set smartcase

set fileformats=unix,dos,mac
set fenc=utf-8
set fencs=utf-8
set tenc=utf-8
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
  " autocmd FileType html,css,javascript,jsx,javascript.jsx setlocal ts=2 sts=2 sw=2
endif
" ----------------plugin----------------------

call plug#begin('~/.vim/plugged')


Plug 'Valloric/YouCompleteMe'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'prettier/vim-prettier'
" Plug 'Chiel92/vim-autoformat'
" Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'tpope/vim-surround'
" Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()

" set theme

syntax on " use plugin
syntax enable " use code heighlight
set background=dark
colorscheme solarized

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_custom_ignore = { 'dir': 'build$\|node_modules$' }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" airline
set laststatus=2
let g:airline_theme="powerlineish"
"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<c-n>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<c-k>']
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

" emmet-vim
" set file type that can sue emmet
autocmd FileType html,css,jsx,javascript.jsx EmmetInstall
" set trigger key is <Tab>
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_mode='a'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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

" vim-json
" disable concealing of double quotes
set conceallevel=0
" let g:vim_json_syntax_conceal = 0

" ale for linter
" let g:ale_fixers = ['eslint', 'prettier']
" let g:ale_sign_error = '👊'
" let g:ale_sign_warning = '🎃'
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
" let g:ale_open_list = 1
" let g:ale_fix_on_save = 1

" vim-signify
" let g:signify_vcs_list = [ 'git', 'hg' ]

" ---------------vim keyboard redefine-------------
" redefine code fold key
" code fold
nnoremap <S-n> zc
nnoremap <S-m> zo

" jump list (previous, next) (<Tab> and <Ctrl-i> is same in vim , so use <Ctrl-l> replace <Ctrl-i> for jump list)
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

" move current line (<commond> and <Alt> has conflict in terminal , so use <Shift>)
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
" in insert model , it conflict with input capital, so annotation
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi

" set indentation line key , use in Normal and Visual Modal
nmap <tab> V>
nmap <S-tab> V<
vmap <tab> >gv
vmap <S-tab> <gv

" set control buffer
nmap <leader>d :bd<CR> " close buffer
nnoremap <S-h> :bp<CR> " pre buffer
nnoremap <S-l> :bn<CR> " next buffer

" set save shortcut key
nmap <leader>w :w<CR>

" redfined enter Normal model key
" inoremap jj <Esc>
" vnoremap jj <Esc>

" set reloading vim when change .vimrc
nnoremap <leader>r :source ~/.vimrc<CR>

" YCM GoTo key（jump list pre use <Ctrl-h> , next is <Ctrl-l>）
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR> " go to declar
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>  " go to definit
nnoremap <leader>g :YcmCompleter GoTo<CR>             " tries to perform the 'most sensible' GoTo operation it can
nnoremap <leader>tp :YcmCompleter GoToType<CR>        " go to type

" ---------vim-prettier------------

" max line length that prettier will wrap on
" Prettier default: 80
" let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4
let g:prettier#config#tab_size = 4

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
" let g:prettier#config#parser = 'markdown'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
