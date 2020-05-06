#!/usr/bin/env bash

__stimim_cwd_prompt() {
  local p=${PWD/#$HOME/\~}
  p=$(echo $p | sed '/\(\/\?.\)[^\/]*\//s//\1\//g')
  echo ${bold_blue}$p${normal}
}

__stimim_scm_prompt() {
  local color=""
  local scm_prompt=""

  # We only use git, so let's scip checking others
  P4_EXE=
  HG_EXE=
  SVN_EXE=
  # load SCM prompt variables
  scm_prompt_vars

  if [[ "${SCM_NONE_CHAR}" != "${SCM_CHAR}" ]]; then
    if [[ "${SCM_DIRTY}" -eq 0 ]]; then
      color="${SCM_THEME_PROMPT_CLEAN_COLOR}"
    else
      color="${SCM_THEME_PROMPT_DIRTY_COLOR}"
    fi
    scm_prompt="${SCM_THEME_PROMPT_PREFIX}"
    scm_prompt+="${SCM_CHAR} ${color}${SCM_BRANCH}${normal}"
    scm_prompt+="${SCM_THEME_PROMPT_SUFFIX}"
  fi
  echo "${scm_prompt}"
}

PS1_user=${bold_green}'\u'${normal}
PS1_host=${bold_yellow}'\h'${normal}
PS1_dir=${bold_blue}'\W'${normal}

SCM_THEME_PROMPT_PREFIX='['
SCM_THEME_PROMPT_SUFFIX='] '
SCM_THEME_PROMPT_CLEAN_COLOR="${bold_green}"
SCM_THEME_PROMPT_DIRTY_COLOR="${bold_red}"

stimim::gen_prompt() {
  local exit_code="$?"

  PS1=$PS1_user'@'$PS1_host':'$(__stimim_scm_prompt)$(__stimim_cwd_prompt)
  if [ "${exit_code}" != 0 ]; then
    PS1="${PS1} [${bold_red}${exit_code}${normal}]"
  fi
  PS1=$PS1"${normal}"'\n\$ '
}

stimim::save_history() {
  # save history
  history -a
  history -c
  history -r
}

# PS1='$(stimim::gen_prompt)'
safe_append_prompt_command stimim::gen_prompt
