if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  RED=$(tput setaf 1; tput bold)
  GRN=$(tput setaf 2; tput bold)
  YEL=$(tput setaf 3; tput bold)
  BLU=$(tput setaf 4; tput bold)
  NOR=$(tput sgr0)
else
  RED=
  GRN=
  YEL=
  BLU=
  NOR=
fi

get_fuzzy_path() {
  local p=${PWD/#$HOME/\~}
  p=$(echo $p | sed '/\(\/\?.\)[^\/]*\//s//\1\//g')
  echo ${BLU}$p${NOR}
}

get_git_branch() {
  local branch=$(git branch 2>/dev/null | sed -n '/\* /s///p')
  if [ -z "$branch" ]; then
    echo -n ""
  else
    local dirty=$(git status --porcelain -uno 2>/dev/null | grep '[MADRC]')
    if [ -z "$dirty" ]; then
      echo -n '['${GRN}$branch${NOR}'] '
    else
      echo -n '['${RED}$branch${NOR}'] '
    fi
  fi
}

PS1_user=$GRN'\u'$NOR
PS1_host=$YEL'\h'$NOR
PS1_dir=$BLU'\W'$NOR

PROMPT_COMMAND="gen_prompt; $PROMPT_COMMAND"

set_title() {
  echo -ne "\033]0;$1\007"
}

gen_prompt() {
  PS1=""
  PS1=$PS1$PS1_user'@'$PS1_host':'$(get_git_branch)$(get_fuzzy_path)
  PS1=$PS1'\n\$ '

  #set_title "${USER}@${HOSTNAME}: ${PWD/$HOME/~}"
}
