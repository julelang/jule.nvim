-- jule.nvim
-- https://github.com/adamperkowski/jule.nvim
-- License: BSD 3-Clause

local M = {}

M.config = {
	format_on_save = true,
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
	if M.config.format_on_save then
		vim.cmd([[
            augroup JuleFormat
                autocmd!
                autocmd BufWritePost *.jule lua require('jule').format()
            augroup END
        ]])
	end
end

function M.format()
	local bufnr = vim.api.nvim_get_current_buf()
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	vim.cmd("silent ! julefmt -w %", bufname)
	vim.cmd("edit")
end

return M
