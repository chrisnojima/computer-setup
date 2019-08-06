set fish_greeting ""
set -x EDITOR nvim
set -x REACT_EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'rg . -g \'!**/Pods/**\' -i --files --color=never'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_DEFAULT_OPTS '
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:174
'

function fish_prompt
    powerline-shell --shell bare $status
end

fish_vi_key_bindings

function fishreset
    source /users/chrisnojima/.config/fish/config.fish
end

function cleanvim
    vim -u NONE $argv
end

function aoff
    adb reverse --remove-all
end

function aon
    adb reverse tcp:8081 tcp:8081
    adb reverse tcp:7007 tcp:7007
    adb reverse tcp:8097 tcp:8097
end

