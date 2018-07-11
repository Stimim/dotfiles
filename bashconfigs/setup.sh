#!/bin/bash

PWD="$(dirname "$(readlink -f $0)")"

(cd "${PWD}/..";
 git submodule init;
 git submodule update)

mv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
cat >"${HOME}/.bashrc" <<__DOC__
source "${PWD}/bashrc.sh"
__DOC__

bash -i -c "bash-it enable alias git general; bash-it enable completion git bash-it; bash-it enable plugin git autojump tmux"
