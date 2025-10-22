-- jule.nvim
-- License:    BSD 3-Clause
-- Repository: https://github.com/julelang/jule.nvim
-- Maintainer: adam <me@adamperkowski.dev>

local M = {}

local registered = false

-- TODO: might wanna refactor this in the future
local function extract_keywords()
    local keywords = {}

    for l in string.gmatch(vim.fn.execute("syntax list"), "[^\r\n]+") do
        local keyword_string = string.match(l, "juleKeyword" .. "%s+xxx%s+(.*)")
        local storage_keyword_string = string.match(l, "juleStorage" .. "%s+xxx%s+(.*)")
        if keyword_string then
            for k in string.gmatch(keyword_string, "%S+") do
                table.insert(keywords, k)
            end
        elseif storage_keyword_string then
            for k in string.gmatch(storage_keyword_string, "%S+") do
                table.insert(keywords, k)
            end
        end
    end

    return keywords
end

function M.setup()
    if registered then
        return
    end

    local has_cmp, cmp = pcall(require, "cmp")
    if not has_cmp then
        return
    end

    local source = {}
    local keywords = extract_keywords()

    source.new = function()
        return setmetatable({}, { __index = source })
    end

    source.complete = function(_, _, callback)
        callback({
            items = vim.tbl_map(function(keyword)
                return {
                    label = keyword,
                    kind = cmp.lsp.CompletionItemKind.Keyword,
                    insertText = keyword,
                }
            end, keywords),
            isIncomplete = false,
        })
    end

    cmp.register_source("jule", source.new())
    registered = true
end

return M
