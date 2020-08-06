# prompt
PROMPT='%n %F{green}%~%f$ ' 

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# alias
alias ll='ls -la'
