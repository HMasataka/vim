# 最新のversion のvimをインストール
```
sudo apt remove vim
```
```
(apt install software-properties-common)
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
apt install software-properties-common
# dein.vimのインストール
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
```

# deocompleteの有効化
```
pip3 install neovim
```

# Language Server の有効化
```
pip3 install python-language-server
go get -u github.com/sourcegraph/go-langserver
```
```
cp ~/.cache/dein/repos/github.com/autozimu/LanguageClient-neovim/bin/languageclient ~/.cache/dein/.cache/.vimrc/.dein/bin/languageclient
```
