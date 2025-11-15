-- jule.nvim
-- License:    BSD 3-Clause
-- Repository: https://github.com/julelang/jule.nvim
-- Maintainer: adam <me@adamperkowski.dev>

local M = {}

function M.indent()
  local lnum = vim.v.lnum
  if lnum <= 1 then return 0 end

  local prev_lnum = vim.fn.prevnonblank(lnum - 1)
  if prev_lnum == 0 then return 0 end
end

return M
