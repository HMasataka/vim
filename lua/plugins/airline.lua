-- vim-airline configuration

return {
    "bling/vim-airline",
    config = function()
        -- Disable blank space warning
        vim.g["airline#extensions#whitespace#enabled"] = 0

        -- Apply airline to tablines
        vim.g["airline#extensions#tabline#enabled"] = 1

        -- Tab number type (1 = consecutive numbers from left)
        vim.g["airline#extensions#tabline#tab_nr_type"] = 1
    end,
}
