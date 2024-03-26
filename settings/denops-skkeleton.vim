imap <C-k> <Plug>(skkeleton-toggle)
cmap <C-k> <Plug>(skkeleton-toggle)

call skkeleton#config({
\   'eggLikeNewline':v:true,
\   'globalDictionaries': [['~/.vim/skk/SKK-JISYO.L', '']],
\   'userDictionary': '~/.vim/skk/skk-jisyo.utf8'
\})
