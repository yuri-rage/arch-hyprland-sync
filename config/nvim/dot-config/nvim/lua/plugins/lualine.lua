return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter", -- ensures it loads late
    config = function()
        require("lualine").setup({
            options = {
                theme = "ayu_dark",
            },
        })
    end,
}
