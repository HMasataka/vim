let g:LanguageClient_diagnosticsEnable = 0

" 補完時に表示されるプレビューウィンドウを消す
set completeopt-=preview

let g:LanguageClient_serverCommands = {}

if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = [expand('pyls')]
endif

let g:LanguageClient_serverCommands['go'] = [$GOPATH.'/bin/go-langserver', '-gocodecompletion']

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'tabnew'})<CR>
nnoremap <F3> :call LanguageClient_textDocument_references()<CR>
