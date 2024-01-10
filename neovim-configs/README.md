# Installation

# Testing
```
PREFIX=./neovim-testing
FAKE_CONFIG_HOME="${PREFIX}/fake-config-home"
FAKE_DATA_HOME="${PREFIX}/fake-data-home"

mkdir -p "${FAKE_CONFIG_HOME}" "${FAKE_DATA_HOME}"

ln -s ~/dotfiles/neovim-configs "${FAKE_CONFIG_HOME}/nvim"

# run neovim
XDG_CONFIG_HOME="${FAKE_CONFIG_HOME}" XDG_DATA_HOME="${FAKE_DATA_HOME}" nvim
```

