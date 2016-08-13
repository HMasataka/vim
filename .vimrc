"colorscheme murphy
colorscheme mstn

"行数表示
set number

" タブを表示するときの幅
 set tabstop=4
" " タブを挿入するときの幅
 set shiftwidth=4
" " タブをタブとして扱う(スペースに展開しない)
 set noexpandtab
 set softtabstop=0

 
 " vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" neobundle.vimの初期化 
" NeoBundleを更新するための設定
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'


NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'thinca/vim-quickrun'

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

call neobundle#end()


"NERD_tree.vim
""---------------------
nnoremap <f2> :NERDTree<CR>
""最後に残ったウィンドウがNERDTREEのみのときはvimを閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=0

" neocomplete.vim
" "------------------------------------
" " NeoCompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" " 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 3
" " smart case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" " camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1
" " _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" " シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3
" " -入力による候補番号の表示
let g:neocomplete#enable_quick_match = 1
" " 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplete#enable_auto_select = 1
" "ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20


"QuickRun
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
nnoremap <f5> :QuickRun

let g:quickrun_config = {
	\   "_" : {
	\       "outputter/buffer/split" : ":botright",
	\       "outputter/buffer/close_on_empty" : 1
	\   },
	\}

" Insertモードのときカーソルの形状を変更
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
