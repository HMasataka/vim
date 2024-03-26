nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute ':LspHover<CR>'
  endif
endfunction

nmap <silent> gd :LspDefinition<CR>
nmap <silent> gi :LspImplementation<CR>
nmap <silent> <space>rf :LspReferences<CR>
nmap <silent> <space>rn :LspRename<CR>
nmap <silent> <space>l :LspFormat<CR>
nmap <silent> <space>n :LspNextError<CR>
nmap <silent> <space>N :LspPreviousError<CR>
nmap <silent> <space>j :LspNextDiagnostic<CR>
nmap <silent> <space>k :LspPreviousDiagnostic<CR>
