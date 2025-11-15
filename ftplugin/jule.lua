-- jule.nvim
-- License:    BSD 3-Clause
-- Repository: https://github.com/julelang/jule.nvim
-- Maintainer: adam <me@adamperkowski.dev>

vim.bo.autoindent = true
vim.bo.foldenable = true
vim.bo.cindent = false
vim.bo.smartindent = false
vim.bo.expandtab = false

vim.bo.indentexpr = 'v:lua.require("jule.indent").indent()'
vim.bo.foldmethod = 'expr'
vim.bo.foldexpr = 'v:lua.require("jule.indent").fold()'
