bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export ANDROID_HOME=/Users/chrisnojima/Library/Android/sdk
#master build
#export NDK_VER=23.1.7779620
export NDK_VER=26.1.10909125
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VER
export ANDROID_NDK=$ANDROID_NDK_HOME
export EDITOR=nvim
export GOPATH=/Users/chrisnojima/go
export KEYBASE_RUN_MODE=prod
#export KEYBASE_DEV_TOOL_ROOTS="/Users/chrisnojima/Library/Application Support/Google/Chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi"
export KEYBASE_DEV_TOOL_EXTENSIONS="/Users/chrisnojima/code/react/packages/react-devtools-extensions/chrome/build/unpacked"
export REACT_EDITOR=nvim
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Users/chrisnojima/.config/yarn/global/node_modules/.bin
export PATH=$PATH:/Users/chrisnojima/.yarn/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/chrisnojima/.local/bin
# export FZF_DEFAULT_COMMAND="rg . -g \'!**/Pods/**\' -i --files --color=never"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS="
# --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 \
# --color info:150,prompt:110,spinner:150,pointer:167,marker:174 \
# "

#alias "lvim=/Users/chrisnojima/.local/bin/lvim"
# alias "nvim=lvim"
alias "vim=nvim"
alias "c=cd $GOPATH/src/github.com/keybase/client"
alias "s=cd $GOPATH/src/github.com/keybase/client/shared"
alias "m=git co master"
alias "cleanvim=lvim -u NONE"
alias "nopluginvim=lvim --noplugin"
alias "aoff=adb reverse --remove-all"
alias "aon=adb reverse tcp:8081 tcp:8081; adb reverse tcp:7007 tcp:7007; adb reverse tcp:8097 tcp:8097"
alias "kbservice=keybase -d --log-file=/Users/chrisnojima/Library/Logs/keybase.service.log service"
alias "kbservicelocal=/Users/chrisnojima/go/bin/keybase -d --log-file=/Users/chrisnojima/Library/Logs/keybase.service.log service"
alias "makekbfs=cd /Users/chrisnojima/go/src/github.com/keybase/client/go/kbfs/kbfsfuse; go build -tags production && KEYBASE_DEBUG=true ./kbfsfuse -debug -mount-type=none"
alias "lsbig=ls -laRd ./**/*(.) | sort -k5 -rn | head -n 40"
alias "reposwitch=yarn pod-clean ; rm -rf node_modules ; yarn modules ; yarn pod-install"
alias "ll=eza -l --icons --no-user --no-permissions"

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

check_deps() {
  # Extract all dependencies (both regular and dev)
  local dependencies=$(jq -r '.dependencies, .devDependencies | to_entries[] | .key' package.json)
  
  # Read each dependency
  echo "$dependencies" | while read -r dep; do
    # Get the current version from package.json
    local current_version=$(jq -r --arg dep "$dep" '.dependencies[$dep] // .devDependencies[$dep]' package.json)
    local latest_version=$(yarn info "$dep" versions --json |  jq -r '.data .[-1]')
    # Check if current version is not the latest and is not in the list of available versions
    if [[ "$current_version" != "$latest_version" ]]; then
      echo "Package not latest: $dep"
      echo -n "Current version: "
      bold $current_version
      echo -n "Latest: "
      green $latest_version
      local dist_version=$(yarn info "$dep" dist-tags --json |  jq -r '.data.latest')
      if [[ "$current_version" != "$dist_version" ]]; then
        echo -n "Dist: "
        green $dist_version
      fi
    fi
  done
}

# goto our path
s
ulimit -n 128000
export PATH="/usr/local/opt/go@1.21/bin:$PATH"
source <(fzf --zsh)
