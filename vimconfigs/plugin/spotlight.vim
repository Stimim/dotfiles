highlight Spotlight0 ctermfg=0 ctermbg=177
highlight Spotlight1 ctermfg=0 ctermbg=39
highlight Spotlight2 ctermfg=0 ctermbg=48
highlight Spotlight3 ctermfg=0 ctermbg=111
highlight Spotlight4 ctermfg=0 ctermbg=210
highlight Spotlight5 ctermfg=0 ctermbg=51
highlight Spotlight6 ctermfg=0 ctermbg=202
highlight Spotlight7 ctermfg=0 ctermbg=191
highlight Spotlight8 ctermfg=0 ctermbg=173
highlight Spotlight9 ctermfg=0 ctermbg=255


call matchadd("Spotlight0", "Spotlight0")
call matchadd("Spotlight1", "Spotlight1")
call matchadd("Spotlight2", "Spotlight2")
call matchadd("Spotlight3", "Spotlight3")
call matchadd("Spotlight4", "Spotlight4")
call matchadd("Spotlight5", "Spotlight5")
call matchadd("Spotlight6", "Spotlight6")
call matchadd("Spotlight7", "Spotlight7")
call matchadd("Spotlight8", "Spotlight8")
call matchadd("Spotlight9", "Spotlight9")


function spotlight#ClearSpotlight(i)
  for group in getmatches()
    if group["group"] == "Spotlight" . a:i
      call matchdelete(group["id"])
    endif
  endfor
endfunction


function spotlight#SetSpotlight(i)
  let pattern = @/
  call spotlight#ClearSpotlight(a:i)
  call matchadd("Spotlight" . a:i, pattern)
endfunction


for i in range(10)
  exec "map <leader>" . i . " :call spotlight#SetSpotlight(" . i . ")<CR>"
endfor
