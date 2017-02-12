" DelRej - Delete a rej file and close the buffer
"
" Usage:
"
" :DelRej[!]

command! -nargs=0 -bang DelRej call DelRej('<bang>')

function! DelRej(bang)
  " XXX Actually respect the bang argument
	let l:curfile = expand("%:p")
  if l:curfile =~? '\.rej$'
    if delete(l:curfile)
      echoerr "Could not delete " . l:curfile
    else
      bunload
      echomsg "Deleted reject file"
    endif
  else
    echoerr "Not a reject file (doesn't end in .rej)"
  endif
endfunction
