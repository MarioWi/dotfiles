
# load external files
fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup
autoload -Uz cursor_mode && cursor_mode

source "$XDG_CONFIG_HOME/zsh/aliases"

# vim mapping for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'k' vi-forward-char
bindkey -M menuselect 'l' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# add autocompletion
autoload -U compinit; compinit
# Autocomplete hidden files
_comp_options+=(globdots)

source ~/dotfiles/zsh/external/completion.zsh

source ~/dotfiles/zsh/external/bd.zsh

source ~/dotfiles/zsh/scripts.sh

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# directory stack
# push the current directory visited on the stack
setopt AUTO_PUSHD
# do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# do not print the directory stack after using pushd popd
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

# start i3 atomaticly
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# syntaxhighlighting should be the last command
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

