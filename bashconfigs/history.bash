# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=40000000
HISTFILESIZE=4000000000
#HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '

# append to the history file, don't overwrite it
shopt -s histappend
# force commands more than one line join to one line
shopt -s cmdhist

#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
