-- jule.nvim
-- https://github.com/julelang/jule.nvim
-- License: BSD 3-Clause

local M = {}

function M.parse_args(args, default)
    if args == nil or args == "" then
        args = default
    end

    return args
end

return M
