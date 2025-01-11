-- jule.nvim
-- License:    BSD 3-Clause
-- Repository: https://github.com/julelang/jule.nvim
-- Maintainer: Adam Perkowski <adas1per@protonmail.com>

local integration = require("jule.integration")
local M = {}

-- Command: JuleC
function M.julec(args)
    integration.parse_args(args, "")
    print(vim.cmd("!julec " .. args))
end

-- Command: JCompile, JCompileProd
function M.julecompile(args, prod)
    integration.parse_args(args, "a.out")

    if prod then
        args = args .. " --opt L2 --production"
    end

    print(vim.cmd("!julec . -o " .. args))
end

-- Command: JTest
function M.juletest(args)
    integration.parse_args(args, "")
    print(vim.cmd("!julec test . " .. args))
end

-- Command: JInit
function M.julemodinit()
    print(vim.cmd("!julec mod init"))
end

-- Command: JEnv
function M.julenv()
    print(vim.cmd("!julec julenv"))
end

return M
