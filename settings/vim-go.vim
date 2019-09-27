let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:go_fmt_command = "goimports"

let g:go_metalinter_enabled = ['golint', 'vet', 'errcheck']
let g:go_metalinter_autosave_enabled = ['golint', 'vet']
let g:go_metalinter_autosave = 1

" go run
au FileType go nmap <silent> grn <Plug>(go-run)
" go test
au FileType go nmap <silent> gt <Plug>(go-test)
" 構造体にtagを追加
au FileType go nmap <silent> gat :GoAddTags<CR>
" 構造体にkeyを追加
au FileType go nmap <silent> gk :GoKeyify<CR>
" if errを追加
au FileType go nmap <silent> gie :GoIfErr<CR>
