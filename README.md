# How To Use

## 最新のversion のvimをインストール

```bash
sudo apt remove vim
```

```bash
(apt install software-properties-common)
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

## deocompleteの有効化

```bash
pip3 install neovim
```

## Language Server の有効化

```bash
(Python)
pip3 install python-language-server

(Go言語)
go get -u golang.org/x/tools/cmd/gopls
```

なぜかlanguageclientのbuildが走らない環境があるので手動でbuild

```bash
cd ~/.cache/dein/repos/github.com/autozimu/LanguageClient-neovim
sh install.sh
cp bin/languageclient ~/.cache/dein/.cache/.vimrc/.dein/bin/languageclient
```
