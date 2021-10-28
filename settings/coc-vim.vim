nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <space>rf <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>l <Plug>(coc-format)
nmap <silent> <space>n <Plug>(coc-diagnostic-next-error)
nmap <silent> <space>N <Plug>(coc-diagnostic-prev-error)

command! -nargs=0 Format :call CocAction('format')

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" K でドキュメント表示
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" tabで補完を確定
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:coc_global_extensions = [
    \ 'coc-flutter',
    \ 'coc-go',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-svelte',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-word',
    \ 'coc-markdownlint',
    \ 'coc-tabnine',
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-spell-checker',
    \ 'coc-omnisharp'
\ ]

" for coc-spell-check
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
