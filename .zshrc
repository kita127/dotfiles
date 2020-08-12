# prompt
PROMPT='%n %F{green}%~%f$ ' 

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# --------------------------------------
# alias
# --------------------------------------
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# --------------------------------------
# fzf
# --------------------------------------
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias fhi='history | fzf'

# open vim from fzf
# only for git managed files
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
  vim $selected_files
}

# fcd - cd to selected directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

