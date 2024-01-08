# Installation
```
# install kitty
sudo apt install kitty

# clone kitty-themes repo
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

# copy my configurations
ln -s $(realpath ./kitty.conf) "${HOME}/.config/kitty/kitty.conf"
```

# Modify Configs
Reference: [link](https://sw.kovidgoyal.net/kitty/conf/)
- `CTRL+SHIFT+F2` to open the config file
- `CTRL+SHIFT+F5` to reload the config
