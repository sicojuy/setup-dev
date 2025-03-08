# Setup

1. install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. config file: ~/.zprofile
```
# oh-my-zsh
# plugins=(git zsh-autosuggestions zsh-fzf-history-search)

# base
# export WORDCHARS='*?[]~=&;!#$%^(){}<>\'

# alias
alias ls='gls --color=auto'
alias ll='ls -l'
alias date='gdate'
alias ts="date '+%s'"
alias dt="date '+%Y-%m-%d %H:%M:%S'"

# brew
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

# golang
export GOROOT=/usr/local/go
export GOPATH=~/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

export GOPROXY='https://goproxy.cn|direct'
export GOSUMDB='sum.golang.google.cn'
export GOFLAGS="-gcflags=all=-N -gcflags=all=-l"

# rust
. "$HOME/.cargo/env"
export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
cp cargo/config.toml ~/.cargo/
```

3. install brew
```
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install

/bin/bash brew-install/install.sh
```

4. install coreutils
```
brew install coreutils
```

5. install alacritty
```
brew install --cask alacritty
mkdir ~/.config/alacritty
cp alacritty.toml ~/.config/alacritty
```

7. install go

8. install rust

9. install neovim
```
brew install neovim
brew install cmake ripgrep fd
brew install rust-analyzer
brew install pyright
pip3 install pynvim
go install mvdan.cc/sh/v3/cmd/shfmt@latest
cargo install stylua
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r nvim ~/.config/nvim
nvim -c "PackerInstall"
```

10. git config
```
cp gitconfig ~/.gitconfig
cp -r gittemplates/ ~/.gittemplates
```
