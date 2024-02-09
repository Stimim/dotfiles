# Installation
```
# install kitty
## ubuntu
sudo apt install kitty

## mac
brew install --cask kitty

# clone kitty-themes repo
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

# copy my configurations
ln -s $(realpath ./kitty.conf) "${HOME}/.config/kitty/kitty.conf"
```

# Modify Configs
## Ubuntu
Reference: [link](https://sw.kovidgoyal.net/kitty/conf/)
- `CTRL+SHIFT+F2` to open the config file
- `CTRL+SHIFT+F5` to reload the config

## Mac
- `CMD+,` to open
- `CMD+CTRL+,` to reload
