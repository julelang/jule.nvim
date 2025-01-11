-- jule.nvim
-- License:    BSD 3-Clause
-- Repository: https://github.com/julelang/jule.nvim
-- Maintainer: Adam Perkowski <adas1per@protonmail.com>

local M = {}

M.config = {
    format_on_save = false,
    format_command = nil,
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
    if M.config.format_on_save then
        vim.cmd([[
            augroup JuleFormat
                autocmd BufWritePost *.jule lua require('jule').format()
            augroup END
        ]])
    end

    vim.cmd("command! -nargs=? JuleC lua require('jule.commands').julec(<f-args>)")
    vim.cmd([[
        command! -nargs=? JCompile lua require('jule.commands').julecompile(vim.fn.expand("<args>"), false)
    ]])
    vim.cmd([[
        command! -nargs=? JCompileProd lua require('jule.commands').julecompile(vim.fn.expand("<args>"), true)
    ]])
    vim.cmd("command! -nargs=? JTest lua require('jule.commands').juletest(<f-args>)")
    vim.cmd("command! JInit lua require('jule.commands').julemodinit()")
    vim.cmd("command! JEnv lua require('jule.commands').julenv()")
    vim.cmd("command! JuleFmt lua require('jule').format()")
end

function M.format()
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local format_command = M.config.format_command or "julefmt -w %"

    local view = vim.fn.winsaveview()

    vim.cmd("silent !" .. format_command, bufname)

    vim.cmd("edit")
    vim.fn.winrestview(view)
end

return M
