"行数表示
set number

" タブを表示するときの幅
set tabstop=4
" " タブを挿入するときの幅
set shiftwidth=4
set expandtab


"改行時に前の行のインデントを継続する
set autoindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する 
set smartindent


if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('sjl/gundo.vim')

call dein#end()

if dein#check_install()
  call dein#install()
endif

" neocomplete.vim
" "------------------------------------
" " NeoCompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" " 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 2
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

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() :"\<CR>"

""" unite.vim
" 入力モードで開始する
"let g:unite_enable_start_insert=1
" バッファ一覧
noremap <silent> <space>b :<C-u>Unite buffer<CR>
" 最近使用したファイル一覧
noremap <silent> <space>s :<C-u>Unite file_mru<CR>

"NERDTree
""起動
noremap <silent> <space>n :NERDTree<CR>

""起動時にNERDTreeを表示
autocmd vimenter * NERDTree
""ファイル名が指定されてVIMが起動した場合はNERDTreeを表示しない
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() != 0 && !exists("s:std_in") | q | endif


"Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

noremap j gj
noremap k gk
noremap ; :
noremap : ;
noremap <CR> A<CR><ESC>

inoremap <C-a> <Esc>ggVG
noremap <C-a> ggVG

inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap <C-n> <ESC>
vnoremap <C-n> <ESC>

" Insertモードのときカーソルの形状を変更
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"行頭（^)と行末($)にカーソルを移動
inoremap <C-e> <Esc><S-a>
inoremap <C-a> <Esc><S-i>
noremap <C-e> <Esc>$
noremap <C-a> <Esc>^

"縛りプレイ
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Down> <Nop>
inoremap <Up> <Nop>

noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>

"画面分割関連
noremap ss :split<CR>
noremap sv :vsplit<CR>
noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
noremap sw <C-w>w

noremap st :tabnew<CR>
noremap sn gt
noremap su gT

set t_Co=256
syntax on

"カラースキーマを自作のものに設定
colorscheme mstn


