# install

* oh-my-zsh
* go
* rust
* brew
* neovim
* alacritty
* tmux

## macos
```
brew install coreutils
brew install --cask font-sauce-code-pro-nerd-font
brew install cmake
brew install ripgrep
brew install fd 
brew install rust-analyzer
brew install pipx
```

## linux
```
apt install cmake
apt install ripgrep
apt install fd-find 
apt install pipx
```

## pipx
```
pipx install pynvim
pipx install ipython
pipx install pyright
```

## go install
```
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
```

## cargo install
```
cargo install stylua
```

# config
```
~/.zprofile
~/.tmux.conf
~/.gitconfig
~/.gittemplates
~/.config/alacritty
~/.config/nvim
~/.cargo
```

# neovim plugins
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -c "PackerInstall"
```
