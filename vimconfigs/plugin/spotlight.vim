highlight Spotlight0 guifg=0 guibg=LightCyan
highlight Spotlight1 guifg=0 guibg=LightGreen
highlight Spotlight2 guifg=0 guibg=LightBlue
highlight Spotlight3 guifg=0 guibg=LightMagenta
highlight Spotlight4 guifg=0 guibg=LightYellow
highlight Spotlight5 guifg=0 guibg=LightGray
highlight Spotlight6 guifg=0 guibg=LightRed
highlight Spotlight7 guifg=0 guibg=SeaGreen
highlight Spotlight8 guifg=0 guibg=SlateBlue
highlight Spotlight9 guifg=0 guibg=Magenta


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
