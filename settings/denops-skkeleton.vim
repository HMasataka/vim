imap <C-k> <Plug>(skkeleton-toggle)
cmap <C-k> <Plug>(skkeleton-toggle)

call skkeleton#config({
\   'eggLikeNewline':v:true,
\   'globalJisyo': '~/.vim/skk/SKK-JISYO.L',
\   'userJisyo': '~/.vim/skk/skk-jisyo.utf8'
\})
