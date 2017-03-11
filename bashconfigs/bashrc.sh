# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix ; then
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
  fi
  # for mac
  if [ -f /usr/local/git/current/share/git-core/git-completion.bash ]; then
    echo source /usr/local/git/current/share/git-core/git-completion.bash
    source /usr/local/git/current/share/git-core/git-completion.bash
  fi
  # for ubuntu
  if [ -f /usr/share/bash-completion/completions/git ]; then
    echo source /usr/share/bash-completion/completions/git
    source /usr/share/bash-completion/completions/git
  fi
fi

add_to_path() {
  if [ $# -le 0 ] ; then
    echo "Missing parameter"
    return
  fi
  if [ -d "$1" ] && [[ ":${PATH}:" != *:${1}:* ]] ; then
    PATH=${PATH}:${1}
    echo "\"$1\" is added to PATH"
  fi
}

# run auto complete
if [ -f $HOME/.bash_complete ] ; then
  . $HOME/.bash_complete
fi

export EDITOR=vim
export SVN_EDITOR=vim

add_to_path /sbin
add_to_path ~/.local/bin

export PATH

#export TERM=xterm-256color

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

load_plugins() {
  for f in $*; do
    echo "loading $CONFIG_DIR/$f"
    . $CONFIG_DIR/$f
  done
}

load_plugins history.bash aliases.bash prompt.bash
