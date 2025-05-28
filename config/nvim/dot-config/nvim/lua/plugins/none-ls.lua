return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.eslint_d,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.clang_tidy,
                },
            })
        end,
    },
    {
        "nvimtools/none-ls-extras.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    require("none-ls.diagnostics.flake8"),
                },
            })
        end,
    },
}
