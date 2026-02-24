# Setup

1. install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. install go

3. install rust
```
cp cargo/config.toml ~/.cargo/
```

4. config ~/.zshrc
```
eval "$(/opt/homebrew/bin/brew shellenv)"

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
```

5. install brew
```
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install

/bin/bash brew-install/install.sh
```

6. install coreutils
```
brew install coreutils
```

7. install alacritty
```
brew install --cask alacritty
mkdir ~/.config/alacritty
cp alacritty.toml ~/.config/alacritty
```

8. install neovim
```
brew install neovim
brew install cmake ripgrep fd
brew install gopls
brew install rust-analyzer
brew install pyright
brew install --cask font-sauce-code-pro-nerd-font
pip3 install pynvim
go install mvdan.cc/sh/v3/cmd/shfmt@latest
cargo install stylua
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r nvim ~/.config/nvim
nvim -c "PackerInstall"
```

9. install tmux
```
apt install tmux
cp tmux.conf ~/.tmux.conf
```

10. git config
```
cp gitconfig ~/.gitconfig
cp -r gittemplates/ ~/.gittemplates
```
