augroup filetype_options
  autocmd!
  autocmd Filetype vim  setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype go   setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype css,scss  setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype javascript,typescript setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" vim status line 
set laststatus=2

set statusline=

set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ \NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ \INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ \REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ \VISUAL\ ':''}

set statusline+=%#PmenuSel#
set statusline+=%#LineNr#

set statusline+=%F%r%h%w%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" neovim winbar
"  set winbar=

"  set winbar+=%#PmenuSel#
"  set winbar+=%#LineNr#

"  set winbar+=%f%r