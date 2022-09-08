# .bash_profile はログイン時にのみ実行されます。具体的な用途は:
#
# 環境変数を設定する (export する変数)
# 環境変数はプロセス間で勝手に受け継がれるのでログイン時のみ設定すれば十分です。

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:/usr/local/opt/llvm/bin:$HOME/bin:$HOME/.nodebrew/current/bin:$HOME/.local/bin"
