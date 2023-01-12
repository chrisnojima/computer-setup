bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export ANDROID_HOME=/Users/chrisnojima/Library/Android/sdk
export NDK_VER=23.1.7779620
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$NDK_VER
export ANDROID_NDK=$ANDROID_NDK_HOME
export EDITOR=lvim
export GOPATH=/Users/chrisnojima/go
export KEYBASE_RUN_MODE=prod
# export KEYBASE_DEV_TOOL_ROOTS="/Users/chrisnojima/Library/Application Support/Google/Chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi"
# export KEYBASE_DEV_TOOL_EXTENSIONS="/Users/chrisnojima/code/react/packages/react-devtools-extensions/chrome/build/unpacked"
export REACT_EDITOR=lvim
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Users/chrisnojima/.config/yarn/global/node_modules/.bin
export PATH=$PATH:/Users/chrisnojima/.yarn/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/chrisnojima/.local/bin
export FZF_DEFAULT_COMMAND="rg . -g \'!**/Pods/**\' -i --files --color=never"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 \
--color info:150,prompt:110,spinner:150,pointer:167,marker:174 \
"

alias "lvim=/Users/chrisnojima/.local/bin/lvim"
alias "nvim=lvim"
alias "vim=lvim"
alias "c=cd $GOPATH/src/github.com/keybase/client"
alias "s=cd $GOPATH/src/github.com/keybase/client/shared"
alias "m=git co master"
alias "cleanvim=lvim -u NONE"
alias "nopluginvim=lvim --noplugin"
alias "aoff=adb reverse --remove-all"
alias "aon=adb reverse tcp:8081 tcp:8081; adb reverse tcp:7007 tcp:7007; adb reverse tcp:8097 tcp:8097"
alias "/usr/local/Cellar/android-sdk/24.4.1_1/platform-tools/systrace/systrace.py --time=10 -o ~/trace.html sched gfx view -a io.keybase.ossifrage"

ssh-add -A 2> /dev/null

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
PROMPT='%~ %{%F{none}%}%(?..%F{red}[%?]%F{white})> '
RPROMPT='%{%F{green}%}$vcs_info_msg_0_'

# goto our path
s
