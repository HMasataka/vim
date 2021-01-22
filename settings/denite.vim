nnoremap <C-f> :Denite file/rec<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-u> denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> / denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
endfunction

call denite#custom#option('default', 'split', 'floating')

call denite#custom#option('default', 'highlight-matched-char', '')
call denite#custom#option('default', 'highlight-matched-range', '')

call denite#custom#option('default', 'vertical_preview', v:true)
call denite#custom#option('default', 'floating_preview', v:true)

call denite#custom#option('default', 'winrow', &lines / 4)
call denite#custom#option('default', 'winheight', &lines / 2)
call denite#custom#option('default', 'preview_height', &lines / 2)

call denite#custom#option('default', 'wincol', &columns / 8)
call denite#custom#option('default', 'winwidth', (&columns / 8) * 3)
call denite#custom#option('default', 'preview_width', &columns / 2)
