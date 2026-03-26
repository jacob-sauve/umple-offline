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
Navigate into your `~/.config/nvim/` directory and clone this repo:
```
cd ~/.config/nvim/
git clone https://github.com/jacob-sauve/umple-offline/
```
Move `umple.lua` into your `~/.config/nvim/ftplugin` folder:
```
mkdir -p ~/.config/nvim/ftplugin
mv -i ~/.config/nvim/umple-offline/ftplugin/umple.lua ~/.config/nvim/ftplugin/umple.lua
rm -r ~/.config/nvim/umple-offline/
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
- `<leader>ugj` --> generates Java code corresponding to the active file into current directory

### Full Commands
In their unabridged form, i.e. without the keybinds from `ftplugin/umple.lua`:
- `:UmpleClassDiagram`  --> same as `<leader>ucd` above
- `:UmpleStateMachine`  --> same as `<leader>usm` above
- `:GenerateJava`       --> same sa `<leader>ugj` above
