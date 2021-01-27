nnoremap <C-g> :Defx -columns=icons:indent:filename:type<CR>

autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
      nnoremap <silent><buffer><expr> <CR> defx#do_action('open', ':tabe')
      nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
      nnoremap <silent><buffer><expr> c defx#do_action('copy')
      nnoremap <silent><buffer><expr> m defx#do_action('move')
      nnoremap <silent><buffer><expr> p defx#do_action('paste')
      nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> N defx#do_action('new_file')
      nnoremap <silent><buffer><expr> d defx#do_action('remove')
      nnoremap <silent><buffer><expr> r defx#do_action('rename')
      nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> <C-u> defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> q defx#do_action('quit')
      nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    endfunction

call defx#custom#option('default', 'split', 'floating')
