nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute ':LspHover<CR>'
  endif
endfunction

nmap <silent> gd :tab LspDefinition<CR>
nmap <silent> gi :tab LspImplementation<CR>
nmap <silent> <space>rf :tab LspReferences<CR>
nmap <silent> <space>rn :LspRename<CR>
nmap <silent> <space>l :LspFormat<CR>
nmap <silent> <space>n :LspNextError<CR>
nmap <silent> <space>N :LspPreviousError<CR>
nmap <silent> <space>j :LspNextDiagnostic<CR>
nmap <silent> <space>k :LspPreviousDiagnostic<CR>

call ddc#custom#patch_global('sources', [
 \ 'lsp',
 \ 'around',
 \ 'file',
 \ ])

call ddc#custom#patch_global('sourceOptions', #{
 \ _: #{
 \   matchers: ['matcher_head'],
 \   sorters: ['sorter_rank'],
 \   converters: ['converter_remove_overlap'],
 \ },
 \ around: #{
 \  mark: 'Around',
 \ },
 \ lsp: #{
 \   mark: 'LSP',
 \   matchers: ['matcher_head'],
 \   forceCompletionPattern: '\.\w*|:\w*|->\w*',
 \ },
 \ file: #{
 \   mark: 'file',
 \   isVolatile: v:true,
 \   forceCompletionPattern: '\S/\S*'
 \ }})

call ddc#custom#patch_global('sourceParams', #{
\   lsp: #{
\     snippetEngine: denops#callback#register({
\           body -> vsnip#anonymous(body)
\     }),
\     enableResolveItem: v:true,
\     enableAdditionalTextEdit: v:true,
\   }
\ })

call ddc#enable()
