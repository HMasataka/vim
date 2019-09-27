nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <space>rf <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>l <Plug>(coc-format)

command! -nargs=0 Format :call CocAction('format')
