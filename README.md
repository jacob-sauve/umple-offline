# umple-offline
Umple visualisation plugin for Neovim; allows for keybound compilation of `.ump` files into tmpfile diagrams for **instantaneous visualisation** in a vertical split-pane, all **within Neovim**!
- No files are saved (_only temporary ones_)
- No Internet connection required! (_unlike [Umple Online](https://cruise.umple.org/umpleonline/)_)

## Dependencies
- [image.nvim](https://github.com/3rd/image.nvim) and its dependencies for image visualisation within nvim.
  - _Note: this script works well when [kitty](https://github.com/kovidgoyal/kitty) is used as a backend, so consider installing kitty and setting it as backend default in image.nvim (this works even when using iterm2 or other terminals!)_
- [umple](https://github.com/umple/Umple)
- [graphviz](https://graphviz.org/download/)
- Not necessary, but pairs nicely with [umple.nvim](https://cruise.umple.org/umple/Neovim.html)

<br>

_The program assumes that these_ (except umple.nvim) _have been installed/configured._

## Installation
Navigate into your `~/.config/nvim/lua` directory and clone this repo:
```
cd ~/.config/nvim/lua
git clone https://github.com/jacob-sauve/umple-offline/
```
If you already have a `~/.config/nvim/ftplugin` folder, merge `ftplugin/umple.lua` into it!
```
cat ~/.config/nvim/lua/umple-offline/ftplugin/umple.lua >> ~/.config/nvim/ftplugin/umple.lua
rm -rf ~/.config/nvim/lua/umple-offline/ftplugin/
```
Require the main lua file in your preexisting `init.lua`. For instance, assuming it is at the root of your nvim directory:
```
echo 'require("umple-offline.src.umple_offline")' >> ~/.config/nvim/init.lua
```
You should be all set!

## Use
If you have not already, be sure to set a `<leader>` key somewhere within your nvim config to be able to use the hotkeys; for instance mine is the space bar:
```
vim.g.mapleader = " "
```
### Hotkeys
- `<leader>ucd` --> generates and opens an Umple Class Diagram of the active file (_the one in the buffer when the command is called_)
- `<leader>usm` --> generates and opens an Umple State Machine of the active file

### Full Commands
In their unabridged form, i.e. without the keybinds from `ftplugin/umple.lua`:
- `:UmpleClassDiagram` --> same as `<leader>ucd` above
- `:UmpleStateMachine` --> same as `<leader>usm` above
