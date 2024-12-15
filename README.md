# Jule for NeoVim
Official Jule extension for NeoVim.

## Features
- Syntax highlighting
- Code formatting (julefmt)

## Installation
### Using Vim-Plug
Add the following line to your Vim configuration file:
```vim
Plug 'adamperkowski/jule.nvim'
```
Then run the following command:
```vim
:PlugInstall
```

## Configuration
Add the following line to your Vim configuration file to enable code formatting:
```lua
require('jule').setup {
  format_on_save = true
}
```

## Code of Conduct
See the [Julenour Code of Conduct](https://jule.dev/code-of-conduct)

## License
The extension is distributed under the terms of the BSD 3-Clause license. <br>
[See License Details](https://jule.dev/pages/license.html)
