# Jule for NeoVim
Official [Jule](https://github.com/julelang/jule) extension for Neovim.

___

- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
  - [Code formatting](#code-formatting)
- [Development](#development)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Execution](#execution)
- [Code of Conduct](#code-of-conduct)
- [License](#license)

___

## Features
- Syntax highlighting
- Code formatting ([julefmt](https://github.com/julelang/julefmt))

## Installation
### [vim-plug](https://github.com/junegunn/vim-plug)
Add the following line to your Vim configuration file:
```vim
Plug 'adamperkowski/jule.nvim'
```
Then run the following command:
```vim
:PlugInstall
```

## Configuration
### Code formatting
```lua
require('jule').setup {
  format_on_save = true
}
```

## Development
### Requirements
- [Lua](https://www.lua.org)
- [Neovim](https://neovim.io)
- [JuleC](https://github.com/julelang/jule)
- [JuleFmt](https://github.com/adamperkowski/julefmt) (optional)

### Setup
1. Make sure all the requirements are installed and are available in your `PATH` variable
2. Clone the repository and navigate to its directory:
```bash
$ git clone git@github.com:adamperkowski/jule.nvim.git
$ cd jule.nvim
```

### Execution
1. Create a test Jule module:
```bash
$ julec mod init
$ echo 'fn main() {
    println("Hello, World!")
}' > main.jule
```
2. Get the path to the plugin:
```bash
$ pwd
```
3. Open Neovim:
```bash
$ nvim main.jule
```
4. Set the runtime path and filetype:
```vim
:set runtimepath+=/path/to/jule.nvim
:set filetype=jule
```
5. Source the plugin:
```vim
:source /path/to/jule.nvim/lua/jule/init.lua
```
6. Configure the plugin:
```vim
:lua require('jule').setup { format_on_save = true }
```
7. Done!

## Code of Conduct
See the [Julenour Code of Conduct](https://jule.dev/code-of-conduct)

## License
The extension is distributed under the terms of the BSD 3-Clause license. <br>
[See License Details](https://jule.dev/pages/license.html)
