alias ptt='ssh -C bbsu@ptt.cc'
alias ptt2='ssh -C bbsu@ptt2.cc'
alias Nethack='ssh nethack@alt.org'

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#alias rm='rm -I'

alias tmux='TERM=xterm-256color tmux'
