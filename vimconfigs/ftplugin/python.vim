setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=80
setlocal wrap

if !exists('g:ycm_chromeos_factory')
  function AddToPythonPath(path)
    if ':' . $PYTHONPATH . ':' =~ ':' . a:path . ':'
      return
    endif

    if empty($PYTHONPATH)
      let $PYTHONPATH = a:path
    else
      let $PYTHONPATH = a:path . ':' . $PYTHONPATH
    endif
  endfunction

  function SetPythonPathForChromeOSFactory()
    let filepath = expand('%:p:h')
    let public_dir = '/mnt/host/source/src/platform/factory'
    let public_pkg = public_dir . '/py_pkg'

    let private_dir_prefix = '/mnt/host/source/src/private-overlays'
    let private_dir_suffix = 'chromeos-base/chromeos-factory-board/files'

    if filepath =~ '^' . public_dir
      call AddToPythonPath(public_pkg)
    elseif filepath =~ '^' . private_dir_prefix .
                           \ '/overlay-.*-private/' .
                           \ private_dir_suffix

      call AddToPythonPath(public_pkg)
      " echo 'add ' . public_pkg . ' to PYTHONPATH'

      let overlay = matchlist(filepath, '\/\(overlay-[^-]*\)')[1]
      let private_pkg = public_dir . '/' . overlay . '/py_pkg'
      call AddToPythonPath(private_pkg)
    endif
  endfunction

  call SetPythonPathForChromeOSFactory()

  let g:ycm_chromeos_factory = 1
endif
