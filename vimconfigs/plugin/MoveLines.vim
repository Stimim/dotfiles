"Move lines up and down
"
if v:version < 700
  finish
endif

nnoremap <C-S-K> :m-2<CR>==
nnoremap <C-S-J> :m+<CR>==

inoremap <C-S-K> <Esc>:m-2<CR>==gi
inoremap <C-S-J> <Esc>:m+<CR>==gi

vnoremap <C-S-K> :m-2<CR>gv=gv
vnoremap <C-S-J> :m'>+<CR>gv=gv

" vim:set ft=vim et sw=2 sts=2:
