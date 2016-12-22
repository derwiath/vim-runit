if exists("g:vim_runit_loaded")
	finish
endif
let g:vim_runit_loaded = 1

function! s:FindFileUpwards(...)
  let l:filename= join(a:000)
  if strlen(l:filename) == 0
    echoerr "usage: FindFileUpwards <filename>"
    return ''
  endif
  let l:path=getcwd()
  let l:candidate=join([l:path, l:filename], '/')
  let l:prev_candidate=''
  while l:candidate != l:prev_candidate
    if filereadable(l:candidate)
      return l:candidate
    endif
    let l:prev_candidate = l:candidate
    let l:path=fnamemodify(l:path, ':h')
    let l:candidate=join([l:path, l:filename], '/')
  endwhile
  return ''
endfunction

function! s:RunItMakeCmd(make_script, ...)
  let l:make_script=<SID>FindFileUpwards(a:make_script)
  if !filereadable(l:make_script)
    echoerr 'Failed to find make script ' . a:make_script
    return
  endif
  execute 'set makeprg=' . l:make_script
  let l:params=''
  if a:0 > 0
    let l:params=join(a:000, ' ')
  endif
  execute 'Make ' . l:params
endfunction

command! -nargs=* RunItMake call <SID>RunItMakeCmd(<f-args>)

function! s:RunItDispatchCmd(script, ...)
  let l:script=<SID>FindFileUpwards(a:script)
  if !filereadable(l:script)
    echoerr 'Failed to find dispatch script ' . a:script
    return
  endif
  let b:dispatch=l:script
  if a:0 > 0
    let b:dispatch=b:dispatch . ' ' . join(a:000, ' ')
  endif
  Dispatch
endfunction

command! -nargs=* RunItDispatch call <SID>RunItDispatchCmd(<f-args>)
