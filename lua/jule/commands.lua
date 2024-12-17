-- jule.nvim
-- https://github.com/julelang/jule.nvim
-- License: BSD 3-Clause

local integration = require("jule.integration")
local M = {}

-- JuleC

function M.julec(args)
    integration.parse_args(args, "")
    print(vim.cmd("!julec " .. args))
end

function M.julecompile(args, prod)
    integration.parse_args(args, "a.out")

    if prod then
        args = args .. " --opt L2 --production"
    end

    print(vim.cmd("!julec . -o " .. args))
end

function M.juletest(args)
    integration.parse_args(args, "")
    print(vim.cmd("!julec test . " .. args))
end

function M.julemodinit()
    print(vim.cmd("!julec mod init"))
end

function M.julenv()
    print(vim.cmd("!julec julenv"))
end

return M
