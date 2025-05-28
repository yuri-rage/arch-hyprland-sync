return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- autoformat on save for lsp supported files
            ---@diagnostic disable-next-line: unused-local
            local on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
                end
            end

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
    },
}
