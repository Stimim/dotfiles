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


let s:spotlight_matches = [
      \ matchadd("Spotlight0", "Spotlight0"),
      \ matchadd("Spotlight1", "Spotlight1"),
      \ matchadd("Spotlight2", "Spotlight2"),
      \ matchadd("Spotlight3", "Spotlight3"),
      \ matchadd("Spotlight4", "Spotlight4"),
      \ matchadd("Spotlight5", "Spotlight5"),
      \ matchadd("Spotlight6", "Spotlight6"),
      \ matchadd("Spotlight7", "Spotlight7"),
      \ matchadd("Spotlight8", "Spotlight8"),
      \ matchadd("Spotlight9", "Spotlight9") ]


function spotlight#SetSpotlight(i)
  let pattern = @/
  let ignored = matchdelete(s:spotlight_matches[a:i])
  let s:spotlight_matches[a:i] = matchadd("Spotlight" . a:i, pattern)
endfunction


for i in range(10)
  exec "map <leader>" . i . " :call spotlight#SetSpotlight(" . i . ")<CR>"
endfor
