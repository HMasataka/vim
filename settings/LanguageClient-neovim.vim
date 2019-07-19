" 補完時に表示されるプレビューウィンドウを消す
set completeopt-=preview

let g:LanguageClient_serverCommands = {}

if executable('rustup')
    let g:LanguageClient_serverCommands['rust'] = [expand('rustup'), 'run', 'nightly', 'rls']
endif

if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = [expand('pyls')]
endif

if executable('gopls')
    let g:LanguageClient_serverCommands['go'] = [$GOPATH.'/bin/gopls']
endif

if executable('efm-langserver')
    let g:LanguageClient_serverCommands['markdown'] = [$GOPATH.'/bin/efm-langserver']
endif

autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'tabnew'})<CR>
nnoremap <F3> :call LanguageClient_textDocument_references()<CR>
