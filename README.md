# Jule for Neovim
Official [Jule](https://github.com/julelang/jule) extension for Neovim.

___

- [Features](#features)
- [Installation](#installation)
  - [vim-plug](#vim-plug)
- [Configuration](#configuration)
  - [Code formatting](#code-formatting)
  - [Completion source](#completion-source)
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
- Basic keyword completion source for [nvim-cmp]

## Installation
### [vim-plug](https://github.com/junegunn/vim-plug)
Add the following line to your Vim configuration file:
```vim
Plug 'julelang/jule.nvim'
```
Then run the following command:
```vim
:PlugInstall
```

## Configuration
### Code formatting
```lua
require('jule').setup {
  format_on_save = true,
  format_command = "julefmt -w %" -- default, optional
}
```

### Completion source
Note that [nvim-cmp] has to be installed.
```lua
require('jule').setup {
  enable_cmp = true
}

require('cmp').setup {
  sources = {
    { name = 'jule' }
  }
}
```

## Development
### Requirements
- [Lua](https://www.lua.org)
- [Neovim](https://neovim.io)
- [JuleC](https://github.com/julelang/jule)
- [JuleFmt](https://github.com/julelang/julefmt)

### Setup
1. Make sure all the requirements are installed and are available in your `PATH` variable
2. Clone the repository and navigate to its directory:
```bash
$ git clone git@github.com:julelang/jule.nvim.git
$ cd jule.nvim
```

### Execution
1. Create a test Jule module:
```bash
$ julec mod init
$ printf "fn main() {\n    println(\"Hello world\")\n}" > main.jule
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
7. Done! (you might need to re-open the buffer for the completion source to initialize properly)

## Code of Conduct
See the [Julenour Code of Conduct](https://jule.dev/code-of-conduct)

## License
The extension is distributed under the terms of the BSD 3-Clause license. <br>
[See License Details](/LICENSE)

[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
