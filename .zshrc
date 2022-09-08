# .bashrc は対話モードの bash を起動する時に毎回実行されます。具体的な用途は:
#
# 環境変数でない変数を設定する (export しない変数)
# エイリアスを定義する
# シェル関数を定義する
# コマンドライン補完の設定をする
# これらは bash を起動する度に毎回設定する必要があるものです。



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

