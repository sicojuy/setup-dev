# Setup

## dependencies

* go
* rust
* neovim
* vim
* cmake
* ripgrep
* fd
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
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install neovim plugins
```
nvim -c "PackerInstall"
```

Install go binaries
```
nvim -c "GoInstallBinaries"

