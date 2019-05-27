" 補完時に表示されるプレビューウィンドウを消す
set completeopt-=preview

let g:LanguageClient_serverCommands = {}

if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = [expand('pyls')]
endif

let g:LanguageClient_serverCommands['go'] = [$GOPATH.'/bin/gopls']
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'tabnew'})<CR>
nnoremap <F3> :call LanguageClient_textDocument_references()<CR>
