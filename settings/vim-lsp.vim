autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json call execute('LspDocumentFormatSync --server=efm-langserver')
autocmd BufWritePre *.go call execute('LspDocumentFormatSync')
