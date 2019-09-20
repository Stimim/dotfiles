#!/usr/bin/env bash

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

stty -ixon

# Path to the bash it configuration
export BASH_IT="${HOME}/dotfiles/third_party/bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='stimim'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

export EDITOR=vim
export SVN_EDITOR=vim

if command -v rg >/dev/null 2>&1 ; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

export BASH_IT_CUSTOM="${HOME}/dotfiles/bashconfigs/custom"

# Load Bash It
source "${BASH_IT}/bash_it.sh"

# override C-w behavior
stty werase undef
bind '\C-w:unix-filename-rubout'
