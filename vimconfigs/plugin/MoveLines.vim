"use Alt+UP, ALT+DOWN to move lines
"
if v:version < 700
  finish
endif

nnoremap <M-UP>   :m-2<CR>==
nnoremap <M-DOWN> :m+<CR>==

inoremap <M-UP>   <Esc>:m-2<CR>==gi
inoremap <M-DOWN> <Esc>:m+<CR>==gi

vnoremap <M-UP>   :m-2<CR>gv=gv
vnoremap <M-DOWN> :m'>+<CR>gv=gv

" vim:set ft=vim et sw=2 sts=2:
