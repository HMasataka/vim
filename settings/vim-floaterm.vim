let g:floaterm_autoclose = 1

nnoremap <C-t> <Cmd>FloatermToggle<CR>

augroup vimrc_floaterm
  autocmd!
  autocmd User FloatermOpen tnoremap <buffer> <silent> <C-t>q <C-\><C-n>:FloatermToggle<CR>
  autocmd User FloatermOpen tnoremap <buffer> <silent> <C-t>t <C-\><C-n>:FloatermNew<CR>
  autocmd User FloatermOpen tnoremap <buffer> <silent> <C-t>p <C-\><C-n>:FloatermPrev<CR>
  autocmd User FloatermOpen tnoremap <buffer> <silent> <C-t>n <C-\><C-n>:FloatermNext<CR>
augroup END
