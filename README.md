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

# deocompleteの有効化
```
pip3 install neovim
```

# aleの有効化
```
pip3 install flake8
```

# Language Server の有効化
```
(Python)
pip3 install python-language-server
(Go言語)
go get -u github.com/sourcegraph/go-langserver
```
```
cp ~/.cache/dein/repos/github.com/autozimu/LanguageClient-neovim/bin/languageclient ~/.cache/dein/.cache/.vimrc/.dein/bin/languageclient
```
