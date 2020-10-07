" Indent Python in the Google way.

if exists("s:loaded")
  finish
endif

let s:loaded = 1
let s:maxoff = 50 " maximum number of lines to look backwards.

function indent#python#GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? 0 :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

if has('nvim')
  let g:pyindent_open_paren = "shiftwidth() * 2"
  let g:pyindent_nested_paren = "shiftwidth() * 2"
  let g:pyindent_continue = "shiftwidth() * 2"
else
  let pyindent_nested_paren="&sw*2"
  let pyindent_open_paren="&sw*2"

  " setlocal indentexpr=stimim#python#GetGooglePythonIndent(v:lnum)
endif
