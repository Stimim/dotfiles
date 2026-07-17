alias ptt='ssh -C bbsu@ptt.cc'
alias ptt2='ssh -C bbsu@ptt2.cc'

alias ru='repo upload . --cbr'
alias rr='repo rebase .'

alias beep="echo -n -e '\a'"

alias tmux='tmx2 -u -T RGB'

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# BTRFS setup
# shortcuts
hash -d btrfs=/usr/local/google/btrfs_mount
hash -d worktree=/usr/local/google/btrfs_mount/worktree
hash -d mirror=/usr/local/google/btrfs_mount/mirror

# Confirm before rebooting
confirm_action() {
  local prompt=$1
  printf "%s [y/N] " "$prompt"
  read -r reply
  if [[ "$reply" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

reboot() {
  if confirm_action "Are you sure you want to reboot?"; then
    command reboot "$@"
  fi
}
