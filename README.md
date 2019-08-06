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
pip3 install 'python-language-server[yapf]'

(Go言語)
go get -u golang.org/x/tools/cmd/gopls

(markdown)
sudo npm install -g markdownlint-cli
```

なぜかlanguageclientのbuildが走らない環境があるので手動でbuild

```bash
cd ~/.cache/dein/repos/github.com/autozimu/LanguageClient-neovim
sh install.sh

(vim)
cp bin/languageclient ~/.cache/dein/.cache/.vimrc/.dein/bin/languageclient

(nvim)
cp -i bin/languageclient ~/.cache/dein/.cache/init.vim/.dein/bin/languageclient
```

## Golang Lint

```bash
env GO111MODULE=off go get -u golang.org/x/lint/golint
```

## nvim

```bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

```bash
cp ~/.vim/colors/mstn3.vim ~/.config/nvim/colors
```
