<h3 align=center> NvRose </h3>

<p align=center>
Neovim's lua config aiming to provide small but very fast IDE. <br>
Cached and compiled plugins and if possible lazy loaded. <br>
Minimalistic and aesthetic UI.
</p>

### Installation
``` $ git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1```

### Updating
~/.config/nvim after installation is git repository, just ```git pull``` and fix merge conflicts. <br>

### Plugins
- Base:
	- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - plugins manager.
	- [NvRose/terminal.nvim](https://github.com/NvRose/terminal.nvim) - simple terminal emulator plugin.
	- [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim) - Speed up loading Lua modules in Neovim to improve startup time.
	- [nvim-lua/plenary.nvim](https://github.com/plenary.nvim) - All the lua functions I don't want to write twice.

- Coding:
	- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - setting neovim's builtin lsp.
	- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - vsc like commenting keybinds.
	- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion engine.
- UI:
	- [catppuccin/nvim](https://github.com/catppuccin/nvim) - default colorscheme.
	- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - better highlighting.


- Utils:
	- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - autoclose brackets, strings...
	- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Finder/Filterer/Previewer/Picker.


### Files
- [init.lua](https://github.com/NvRose/NvRose/init.lua) - User plugins, keybinds, autocmds
- [lua/base.lua](https://github.com/NvRose/NvRose/lua/base.lua) - Bootstrap, tweaks like disabled builtins/providers

### Startup
<table>
	<tr><td> Resolve </td> <td> Load </td></tr>
	<tr><td> 3.458ms </td> <td> 4.691ms </td></tr>
</table>

### Builtin tweaks
- Disabled neovim builtin plugins
- Disabled neovim builtin providers
- Handy api bindings

### Roadmap
- WIP:
	- Self update plugin
- TODO:
	- [ ] - Builtin tabs and statusbar plugins

### 📜 License
NvRose is released under MIT license, which grants the following permissions:
- Commercial use
- Distribution
- Modification
- Private use <br>
For more details see [license](https://github.com/NvRose/terminal/license).
