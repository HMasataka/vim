nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <space>rf <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>l <Plug>(coc-format)
nmap <silent> <space>n <Plug>(coc-diagnostic-next-error)
nmap <silent> <space>N <Plug>(coc-diagnostic-prev-error)
nmap <silent> <space>j <Plug>(coc-diagnostic-next)
nmap <silent> <space>k <Plug>(coc-diagnostic-prev)

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
    \ 'coc-jedi',
    \ 'coc-diagnostic',
    \ 'coc-sql',
    \ 'coc-go',
    \ 'coc-rls',
    \ 'coc-omnisharp',
    \ 'coc-svelte',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-tabnine',
    \ 'coc-docker',
    \ 'coc-markdownlint',
    \ 'coc-json',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-spell-checker',
    \ 'coc-simple-react-snippets',
    \ 'coc-snippets',
    \ 'coc-gitignore',
    \ 'coc-word',
    \ 'coc-fzf-preview'
\ ]

" for coc-spell-check
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" for coc-fzf-preview
set shell=/bin/zsh
let $SHELL = "/bin/zsh"

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]
nnoremap <silent> [fzf-p]f     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]s    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]a    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>

let g:OmniSharp_server_use_mono = 1
