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

            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" }
            }

            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function(args)
                    local bufnr = args.buf
                    local clients = vim.lsp.get_clients({ bufnr = bufnr })
                    local has_formatter = false
                    for _, client in ipairs(clients) do
                        if client.supports_method("textDocument/formatting") then
                            has_formatter = true
                            break
                        end
                    end
                    if has_formatter then
                        vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
                    end
                end,
            })

            -- Inlay hints on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    if vim.b[bufnr].lsp_attached then return end
                    vim.b[bufnr].lsp_attached = true

                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end
                end,
            })

            local servers = {
                "ts_ls", "html", "clangd", "pylsp", "esbonio",
                "lua_ls", "dockerls", "eslint",
            }

            -- harper-ls uses an underscore name in lspconfig but a hyphen in Mason
            vim.lsp.config("harper_ls", {
                capabilities = capabilities,
                settings = {
                    ["harper-ls"] = {
                        userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
                        linters = { ToDoHyphen = false },
                    },
                },
            })
            vim.lsp.enable("harper_ls")

            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end

            -- Mason: ensure tools are installed
            require("mason").setup({
                ensure_installed = vim.list_extend(vim.deepcopy(servers), { "harper-ls" }),
            })

            local formatters = { "black", "clang-format", "isort", "prettierd", "stylua" }
            local linters    = { "flake8", "rstcheck", "cspell", "markdownlint", "eslint_d" }

            local mason_registry = require("mason-registry")
            for _, tool in ipairs(vim.list_extend(formatters, linters)) do
                if not mason_registry.is_installed(tool) then
                    local pkg = mason_registry.get_package(tool)
                    if pkg then
                        pkg:install()
                    else
                        vim.notify("Mason package not found: " .. tool, vim.log.levels.WARN)
                    end
                end
            end
        end,
    },
}
