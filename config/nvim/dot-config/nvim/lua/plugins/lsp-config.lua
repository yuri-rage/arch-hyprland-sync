return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")

            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" }
            }

            local on_attach = function(client, bufnr)
                if vim.b[bufnr].lsp_attached then
                    return
                end
                vim.b[bufnr].lsp_attached = true
                
                if client.supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(bufnr, true)
                end
                
                if client.supports_method("textDocument/formatting") then
                    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
                end
            end

            local servers = {
                "ts_ls",
                "html",
                "clangd",
                "pylsp",
                "esbonio",
                "lua_ls",
                "dockerls",
                "eslint",
                "harper-ls",
            }

            local formatters = {
                "black",
                "clang-format",
                "isort",
                "prettierd",
                "stylua",
            }

            local linters = {
                "flake8",
                "rstcheck",
                "cspell",
                "markdownlint",
                "eslint_d",
            }

            require("mason").setup({
                ensure_installed = servers,
            })

            local mason_registry = require("mason-registry")
            for _, tool in ipairs(vim.list_extend(formatters, linters)) do
                if mason_registry.is_installed(tool) then
                else
                    local pkg = mason_registry.get_package(tool)
                    if pkg then
                        pkg:install()
                    else
                        vim.notify("Mason package not found: " .. tool, vim.log.levels.WARN)
                    end
                end
            end

            for _, server in ipairs(servers) do
                if server == "harper-ls" then
                    lspconfig.harper_ls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            ["harper-ls"] = {
                                userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
                                linters = {
                                    ToDoHyphen = false,
                                },
                            },
                        },
                    })
                else
                    lspconfig[server].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end
            end
        end,
    },
}
