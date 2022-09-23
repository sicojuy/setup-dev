# Setup

## dependencies

MacOS
```
brew install cmake python ripgrep python-pip
```

Ubuntu
```
apt install cmake python3-dev build-essential ripgrep python-pip
```

Common
```
pip install pynvim
```

## setup vim

Install vim

Copy vim config
```
cp -r vim ~/.vim
```

Install vim plugins
```
vim -c "PlugInstall"
```

Install go binaries
```
vim -c "GoInstallBinaries"
```

Install YouCompleteMe
```
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer --go-completer --rust-completer
```

## setup neovim

Install neovim

Copy neovim config
```
cp -r nvim ~/.config/nvim
```

Install neovim plugins
```
nvim -c "PackerInstall"
```

