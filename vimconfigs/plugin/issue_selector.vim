" let s:vim_dir = join([g:localrc_project_root, 'devtools', 'vim'], '/')
let s:issue_file = join([expand('<sfile>:h'), 'issues.csv'], '/')
let s:issue_list = []
let s:issue_list_loaded = 0

function issue_selector#LoadIssueList(force)
  if s:issue_list_loaded && ! a:force
    return
  endif
python << ENDPYTHON
import csv
import vim

issue_list = []
with open(vim.eval('s:issue_file')) as f:
  reader = csv.DictReader(f, delimiter=',', quotechar='"')
  for row in reader:
    issue_list.append(row)

vim.command("let s:issue_list = %r" % issue_list)
ENDPYTHON

  let s:issue_list_loaded = 1
endfunction

function issue_selector#SelectIssues()
  let s:current_buffer = @%

  split ISSUES
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  noremap <buffer> <CR> :call issue_selector#OnSelect()<CR>
  noremap <buffer> <C-r> :call issue_selector#ShowIssues(1)<CR>

  stopinsert

  call issue_selector#ShowIssues(0)
endfunction

function issue_selector#ShowIssues(force)
  setlocal modifiable
  %delete _
  call issue_selector#LoadIssueList(a:force)
  for i in range(len(s:issue_list))
    let info = s:issue_list[i]['ISSUE_ID'] . ' ' . s:issue_list[i]['TITLE']
    call setline(i + 1, info)
  endfor
  setlocal nomodifiable
endfunction

function issue_selector#OnSelect()
  let i = line('.') - 1
  bdelete ISSUES
  execute "buffer" s:current_buffer
  let is_eol = col('.') == col('$') - 1
  if is_eol
    execute "normal" "A" . s:issue_list[i]['ISSUE_ID']
  else
    execute "normal" "i" . s:issue_list[i]['ISSUE_ID']
    execute "normal" "l"
  endif

  startinsert
endfunction

inoremap <C-B> <C-o>:call issue_selector#SelectIssues()<CR>
