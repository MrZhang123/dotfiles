augroup filetype_options
  autocmd!
  autocmd Filetype vim  setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype go   setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype css,scss  setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype javascript,typescript setlocal ts=2 sts=2 sw=2 expandtab
augroup END
