#!/usr/bin/env bash

# helper functions to enable bash-it plugins

list_enabled() {
  local aliases=()
  local completions=()
  local plugins=()

  while IFS= read -r -d '' file ; do
    if [[ "${file}" =~ .aliases.bash$ ]]; then
      aliases+=("${file}")
    elif [[ "${file}" =~ .completion.bash$ ]]; then
      completions+=("${file}")
    elif [[ "${file}" =~ .plugin.bash$ ]]; then
      plugins+=("${file}")
    fi
  done < <(find "${BASH_IT}" -type l -path '*enabled*' -printf '%f\0')

  declare -p aliases
  declare -p completions
  declare -p plugins
}

set_enabled() {
  local file="$1"

  if ! source "${file}" ; then
    return
  fi

  # disable all by delete all symlinks
  find "${BASH_IT}" -type l -path '*enabled*' -delete

  mkdir -p "${BASH_IT}/aliases/enabled/"
  for v in "${aliases[@]}"; do
    echo "enabling $v"
    ln -s "../available/$v" "${BASH_IT}/aliases/enabled/$v"
  done

  mkdir -p "${BASH_IT}/completion/enabled/"
  for v in "${completions[@]}"; do
    echo "enabling $v"
    ln -s "../available/$v" "${BASH_IT}/completion/enabled/$v"
  done

  mkdir -p "${BASH_IT}/plugins/enabled/"
  for v in "${plugins[@]}"; do
    echo "enabling $v"
    ln -s "../available/$v" "${BASH_IT}/plugins/enabled/$v"
  done
}
