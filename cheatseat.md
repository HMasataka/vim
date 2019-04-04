## normal mode

### space + n
リンクを開く

### 行の先頭、最後
Ctrl + a 行の先頭
Ctrl + e 行の最後

### ウィンドウ分割
ss 水平分割
sv 垂直分割
sh <C-w>h
sj <C-w>j
sk <C-w>k
sl <C-w>l

### タブ
st 新規タブ
sn 次タブ
sp 前タブ
s<N> 指定したタブ

### カッコ
go 対応するカッコ

### easymotion
f 順方向一文字検索
F 逆方向一文字検索
<space>f ページ内二文字検索

### vim-operator-replace
R  Rから始まるテキストオブジェクトで置換可能に（ヤンクなし）

### fugitive
gs :Gstatus<CR>
gf :Gdiff<CR>
gp :Git push origin

：Gstatus上の変更のあったファイルにカーソルを合わせた状態で
Dで:Gdiff起動(差分表示)
-でaddとresetの切り替え
pでパッチを表示
Enterでファイル表示

:Gstatusの画面上で
Cでcommit

### gitgutter
gn Gitの変更箇所に移動
gN Gitの変更箇所に移動(逆方向)

### LanguageClient
K :call LanguageClient#textDocument_hover()<CR>
gd 定義元を新しいタブで開く
<F3> 利用されているファイルを調べる

### Gundo
<F5> gundo

### winresizer
<C-q> リサイズモード

### emmet
https://qiita.com/muran001/items/9ce24525b3285678acc3

## insert mode

### 行の先頭、最後
Ctrl + a 行の先頭
Ctrl + e 行の最後
