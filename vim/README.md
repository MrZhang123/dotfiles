## VIM的配置

### 使用的插件

> 使用[vim-plug](https://github.com/junegunn/vim-plug)作为插件管理工具

```sh
Plug 'Valloric/YouCompleteMe'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
```

### 自定义快捷键

* 配置中，设置了`let mapleader=';'`，vim的默认leader键是`\`，
* 进入vim正常模式可以使用Esc和Ctrl-c，推荐使用Ctrl-c，更加方便

##### 代码折叠

> 普通模式

* shift-n 折叠代码
* shift-m 展开代码

##### 按照list跳转

> 普通模式

* Ctrl-l 往后跳转list
* Ctrl-h 往前跳转list

⚠️ 在vim中，`<Tab>`和`<Ctrl-i>`的功能是一样的，为了不冲突，修改快捷键

##### 移动当前行

> 普通模式，可视模式

* Shift-j 下移当前行
* Shift-k 下移当前行

##### 代码缩进

> 普通模式，可视模式，可以单行，也可以在可视模式中选中多行缩进

* Tab 向后缩进
* Shift-Tab 向前缩进

⚠️ **这里因为用到tab作为缩进的快捷键，所以如果其他插件使用tab做快捷键，可能会出现影响，这里要注意一下**

##### 操作buffer

> 普通模式

* ;d 关闭当前buffer
* Shift-h 移动到前一个buffer
* Shift-l 移动到后一个buffer

##### 操作tab

* ;tn 新建tab
* ;th 前一个tab
* ;tl 后一个tab
* ;tc 关闭当前tab

##### 保存文件

> 普通模式

* ;w 保存文件修改

##### 刷新vim

> 普通模式，通常修改vim后，为了不关闭vim直接看效果，设置快捷键

* ;r 修改配置后，刷新vim

### 自定义插件快捷键

##### YouCompleteMe

* Ctrl-j 向下选择list补全
* Ctrl-k 向上选择list补全
* ;dc 跳转到声明处
* ;df 跳转到定义处
* ;g  跳转最合适的地方
* ;tp 跳转到type

##### emmet-vim

* Ctrl-o 触发emmet补全的快捷键

不使用`<Tab>`的原因是与缩进有冲突

##### ultisnips

* Ctrl-e 触发代码片段补全

##### fzf

* ;rg 使用rg进行词汇搜索
* ;b 查找当前打开的buffer
* Ctrl-p 查找当前项目的文件
