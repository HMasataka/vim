" reload file
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd CursorMoved * checktime
augroup END

" Restore the last cursor position when opening a file
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif