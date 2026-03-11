bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export ANDROID_HOME=$HOME/Library/Android/sdk
#master build
#echo 'loading old ndk TEMP zshrc'
#export NDK_VER=23.1.7779620
# new ver
export NDK_VER=26.1.10909125
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VER
export ANDROID_NDK=$ANDROID_NDK_HOME
export EDITOR=nvim
export GOPATH=$HOME/go
export KEYBASE_RUN_MODE=prod
#export KEYBASE_DEV_TOOL_ROOTS="/Users/chrisnojima/Library/Application Support/Google/Chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi"
#export KEYBASE_DEV_TOOL_EXTENSIONS="/Users/chrisnojima/code/react/packages/react-devtools-extensions/chrome/build/unpacked"
export REACT_EDITOR=nvim
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.local/bin
#export PATH=/usr/local/opt/go@1.22/bin:$PATH
# we have a bugfix in a go fork in kb
#export GOROOT=/Users/chrisnojima/code/go
export GOROOT="$(brew --prefix go)/libexec"
#export PATH=$GOROOT/bin:$PATH

alias "vim=nvim"
alias "c=cd $GOPATH/src/github.com/keybase/client"
alias "s=cd $GOPATH/src/github.com/keybase/client/shared"
alias "c2=cd $GOPATH/src/github.com/keybase/client2"
alias "m=git co master"
alias "cleanvim=nvim -u NONE"
alias "nopluginvim=nvim --noplugin"
alias "aoff=adb reverse --remove-all"
alias "aon=adb reverse tcp:8081 tcp:8081; adb reverse tcp:7007 tcp:7007; adb reverse tcp:8097 tcp:8097"
alias "kbservice=keybase -d --log-file=$HOME/Library/Logs/keybase.service.log service"
alias "kbservicelocal=$HOME/go/bin/keybase -d --log-file=$HOME/Library/Logs/keybase.service.log service"
alias "makekbfs=cd $HOME/go/src/github.com/keybase/client/go/kbfs/kbfsfuse; go build -tags production && KEYBASE_DEBUG=true ./kbfsfuse -debug -mount-type=none"
alias "lsbig=ls -laRd ./**/*(.) | sort -k5 -rn | head -n 40"
alias "reposwitch=yarn pod-clean ; rm -rf node_modules ; yarn modules ; yarn pod-install"
alias "ll=eza -l --icons --no-user --no-permissions"
alias "linttemp=yarn tsc > temp.log ; yarn lint >> temp.log"

ssh-add -A 2> /dev/null

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
PROMPT='%~ %{%F{none}%}%(?..%F{red}[%?]%F{white})> '
RPROMPT='%{%F{green}%}$vcs_info_msg_0_'

bold() {
  echo -e "\e[31m$1\e[0m"
}
green() {
  echo -e "\e[32m$1\e[0m"
}

# goto our path
s
ulimit -n 128000
source <(fzf --zsh)
export PATH=$PATH:$HOME/.maestro/bin
