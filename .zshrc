# prompt
PROMPT='%n %F{green}%~%f$ ' 

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# --------------------------------------
# alias
# --------------------------------------
# some more ls aliases
alias ll='ls -alF'
alias l='ls -Al'
alias la='ls -A'
alias org-gcc='x86_64-elf-gcc'


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

