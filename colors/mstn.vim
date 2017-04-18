let g:colors_name = expand('<sfile>:t:r')
set background=dark

highlight clear

if exists("syntax_on")
	  syntax reset
endif

"以下、:help group-nameでグループを確認しながら記述

"単語追加はここではなく/usr/share/vim/vim74/syntax へ

highlight Normal  	ctermbg=Black	ctermfg=white
highlight Comment 					ctermfg=gray
highlight Constant					ctermfg=cyan
highlight Statement	cterm=bold		ctermfg=yellow
highlight PreProc	cterm=bold		ctermfg=lightred
highlight Type		cterm=bold		ctermfg=red
highlight Underlined				ctermfg=red
highlight Todo		cterm=bold		ctermfg=red			ctermbg=white
