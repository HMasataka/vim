set termwinsize=6x0

noremap <silent> <space>t :call TermOpen()<CR>
noremap <silent> <space>q :call ExitTermAbs()<CR>

function! TermOpen()
    if empty(term_list())
        execute "terminal"
    else
        call win_gotoid(win_findbuf(term_list()[0])[0])
    endif
endfunction


augroup term-exit
  autocmd!
  autocmd BufEnter * call ExitTerm()
augroup END


function! CreateBufnr2tabnrDict() abort " {{{
  let bufnr2tabnr_dict = {}
  for tnr in range(1, tabpagenr('$'))
    for bnr in tabpagebuflist(tnr)
      let bufnr2tabnr_dict[bnr] = has_key(bufnr2tabnr_dict, bnr) ? add(bufnr2tabnr_dict[bnr], tnr) : [tnr]
    endfor
  endfor
  for val in values(bufnr2tabnr_dict)
    call uniq(sort(val))
  endfor
  return bufnr2tabnr_dict
endfunction " }}}


function! Bufnr2tabnr(bnr) abort " {{{
  return CreateBufnr2tabnrDict()[a:bnr]
endfunction " }}}


function! ExitTerm()
    if !empty(term_list())
        let term_tabnr = Bufnr2tabnr(term_list()[0])
        let num_win_in_tabnr = tabpagewinnr(term_tabnr[0], '$')
        if num_win_in_tabnr == 1
            call term_sendkeys(term_list()[0], "exit\<CR>")
        endif
    endif
endfunction


function! ExitTermAbs()
    call term_sendkeys(term_list()[0], "exit\<CR>")
endfunction
