function! s:skkeleton_init() abort
  call skkeleton#config({
    \   'eggLikeNewline':v:true,
    \   'globalDictionaries': [['~/.vim/skk/SKK-JISYO.L', '']],
    \   'userDictionary': '~/.vim/skk/skk-jisyo.utf8'
    \})
  call skkeleton#register_keymap('input', "<C-q>", 'katakana')
  call skkeleton#register_keymap('henkan', "<C-q>", 'katakana')
  call skkeleton#register_keymap('input', "<S-q>", 'hankatakana')
  call skkeleton#register_keymap('henkan', "<S-q>", 'hankatakana')
  call skkeleton#register_keymap('input', "<S-g>", '')
  call skkeleton#register_keymap('henkan', "<S-g>", '')
endfunction
augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END
