let g:colors_name = expand('<sfile>:t:r')
set background=dark
highlight clear

if exists("syntax_on")
	  syntax reset
endif

" 通常文字
hi Normal       ctermbg=234
hi Normal                   ctermfg=255

" ifとか
hi Statement                ctermfg=26
hi Operator                 ctermfg=31

" 文字列、数字、true or false
hi Constant                 ctermfg=155
hi Number                   ctermfg=80
hi Boolean                  ctermfg=86

" intとか
hi Type                     ctermfg=228

" #includeとか
hi PreProc                  ctermfg=240
hi PreCondit                ctermfg=0

" エラー
hi Error        ctermbg=88

" htmlとかのリンク
hi Underlined               ctermfg=1

" html関連
hi htmlTagName              ctermfg=190
hi Title                    ctermfg=159
hi Identifier               ctermfg=223
hi Function                 ctermfg=152

" ポップアップ
hi Pmenu        ctermbg=0   ctermfg=255

" 範囲選択
hi Visual       ctermbg=0   ctermfg=255

" 行番号
hi LineNr                   ctermfg=13

" 検索結果
hi Search       ctermbg=5   ctermfg=15

" スペルがおかしいやつ
hi SpellBad     ctermbg=88
hi SpellCap     ctermbg=88
hi SpellRare    ctermbg=88
