-- jule.nvim
-- https://github.com/julelang/jule.nvim
-- License: BSD 3-Clause

local M = {}

-- JuleC

function M.julec(args)
    if args == nil or args == "" then
        args = ""
    end

    local result = vim.cmd("!julec " .. args)
    print(result)
end

function M.julecompile(args, prod)
    if args == nil or args == "" then
        args = "a.out"
    end

    if prod then
        args = args .. " --opt L2 --production"
    end

    local result = vim.cmd("!julec . -o " .. args)
    print(result)
end

function M.juletest(args)
    if args == nil or args == "" then
        args = ""
    end

    local result = vim.cmd("!julec test . " .. args)
    print(result)
end

function M.julemodinit()
    local result = vim.cmd("!julec mod init")
    print(result)
end

function M.julenv()
    local result = vim.cmd("!julec julenv")
    print(result)
end

return M
