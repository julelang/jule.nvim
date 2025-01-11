-- jule.nvim
-- License:    BSD 3-Clause
-- Repository: https://github.com/julelang/jule.nvim
-- Maintainer: Adam Perkowski <adas1per@protonmail.com>

vim.filetype.add({
    extension = {
        jule = "jule",
    },
    filename = {
        ["jule.mod"] = "jule",
    },
})
