# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi


# bash 補完を有効
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# start 環境変数 --------------------------------------------
GOPATH="$HOME/go"
export GOPATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

PATH="$PATH:$GOPATH/bin"

PATH="$PATH:$HOME/.local/bin"

# go
PATH="$PATH:/usr/local/go/bin"

# rust
PATH="$PATH:$HOME/.cargo/bin"

PATH="$PATH:/usr/local/opt/mysql@5.7/bin"

PATH="$PATH:/usr/local/opt/llvm/bin"

PATH="$PATH:$HOME/.nodebrew/current/bin"

# composer
# export PATH="$PATH:~/.composer/vendor/bin"

export PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# end 環境変数 --------------------------------------------

# ghcup
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
