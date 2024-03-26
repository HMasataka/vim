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

call ddc#custom#patch_global({
\   'ui': 'native',
\   'sources': [
\       'vim-lsp',
\       'around',
\       'mocword',
\       'buffer',
\       'file',
\   ],
\   'sourceOptions': {
\       '_': {
\           'matchers'  : ['matcher_head'],
\           'sorters'   : ['sorter_rank'],
\           'converters': ['converter_remove_overlap'],
\           'ignoreCase': v:true,
\       },
\       'around': {
\           'mark': '[Arround]',
\       },
\       'file': {
\           'mark': '[File]',
\       },
\       'buffer': {
\           'mark': '[Buffer]',
\       },
\       'mocword': {
\           'mark': '[Mocword]',
\           'minAutoCompleteLength': 2,
\           'isVolatile': v:true,
\       },
\       'vim-lsp': {
\           'mark': '[LSP]',
\           'forceCompletionPattern': '\.\w*|:\w*|->\w*',
\       },
\   },
\   'sourceParams': {
\       'around': { 'maxSize': 500 },
\       'buffer': {
\           'requireSameFiletype': v:false,
\           'limitBytes': 5000000,
\           'fromAltBuf': v:true,
\           'forceCollect': v:true,
\       },
\   },
\})

call ddc#enable()
