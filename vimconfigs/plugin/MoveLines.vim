"Move lines up and down
"
if v:version < 700
  finish
endif

nnoremap <A-UP> :m-2<CR>==
nnoremap <A-DOWN> :m+<CR>==

inoremap <A-UP> <Esc>:m-2<CR>==gi
inoremap <A-DOWN> <Esc>:m+<CR>==gi

vnoremap <A-UP> :m-2<CR>gv=gv
vnoremap <A-DOWN> :m'>+<CR>gv=gv

" vim:set ft=vim et sw=2 sts=2:
