# Setup

## dependencies

* go
* rust
* cargo
* neovim
* vim
* cmake
* ripgrep
* python-pip
* rust-analyzer(nvim)
* clangd(nvim)
* pynvim(nvim)
* shfmt(nvim)
* stylua(nvim) 

## setup vim

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

Copy neovim config
```
cp -r nvim ~/.config/nvim
```

Install packer

Install neovim plugins
```
nvim -c "PackerInstall"
```

Install go binaries
```
nvim -c "GoInstallBinaries"

