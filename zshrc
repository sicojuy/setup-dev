# alias
alias ls='gls --color=auto'
alias ll='ls -l'
alias date='gdate'
alias ts="date '+%s'"
alias dt="date '+%Y-%m-%d %H:%M:%S'"

# brew
export HOMEBREW_BOTTLE_DOMAIN='https://mirrors.ustc.edu.cn/homebrew-bottles'

# golang
export GOROOT=/usr/local/go
export GOPATH=~/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

export GOSUMDB='sum.golang.google.cn'
export GOPROXY='https://goproxy.cn|direct'
export GOPRIVATE='*.everphoto.cn,git.smartisan.com'
export GOFLAGS="-gcflags=all=-N -gcflags=all=-l"

# rust
. "$HOME/.cargo/env"

export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
