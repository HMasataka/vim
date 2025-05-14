# How To Use

## Requirements

```bash
ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
ln -s ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
```

### Python

#### formatter

```bash
pip install black
```

### Terraform

```bash
brew install hashicorp/tap/terraform-ls
```

### CSharp

```bash
dotnet tool install -g csharp-ls
```

### Color Scheme

```bash
cp ~/.vim/colors/mstn3.vim ~/.config/nvim/colors
```

## Install neovim

### Ubuntu

```bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

### Mac

```bash
brew install neovim
```

## Install dependencies

```bash
go install golang.org/x/tools/cmd/goimports@latest
```
