" Remove trailing spaces
"
if v:version < 700
  finish
endif

au BufWrite *.[ch]        call RemoveTrailingSpaces()
au BufWrite *.[ch]pp      call RemoveTrailingSpaces()
au BufWrite *.java        call RemoveTrailingSpaces()
au BufWrite *.lua         call RemoveTrailingSpaces()
au BufWrite *.rb          call RemoveTrailingSpaces()
au BufWrite *.py          call RemoveTrailingSpaces()
au BufWrite *.sh          call RemoveTrailingSpaces()

function! RemoveTrailingSpaces()
  let saved_pos = getpos(".")
  %s/\s\+$//ge
  call setpos('.', saved_pos)
endfunction

" vim:set ft=vim et sw=2 sts=2:
