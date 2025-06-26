return {
    "folke/snacks.nvim",
    keys = {
        { "Q",          "<nop>",                desc = "Disable Ex mode",                mode = "n" },
        { "<Esc>",      "<cmd>nohlsearch<CR>",  desc = "Clear search on ESC",            mode = "n" },
        { "<leader>y",  '"+y',                  desc = "Yank to system clipboard",       mode = { "n", "v" } },
        { "<leader>Y",  '"+Y',                  desc = "Yank to EOL (system clipboard)", mode = { "n", "v" } },
        { "<leader>d",  '"_d',                  desc = "Delete (no yank)",               mode = { "n", "v" } },
        { "<leader>p",  '"_dP',                 desc = "Paste (no yank)",                mode = "x" },
        { "K",          "<CMD>m '<-2<CR>gv=gv", desc = "Move visual block up",           mode = "v" },
        { "J",          "<CMD>m '>+1<CR>gv=gv", desc = "Move visual block down",         mode = "v" },
        { "<leader>oi", "<CMD>Oil --float<CR>", desc = "Edit filesystem (Oil)",          mode = "n" },
        {
            "<leader>lg",
            function()
                Snacks.lazygit()
            end,
            desc = "Open lazygit",
            mode = "n",
        },
        {
            "<leader>s",
            [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
            desc = "Global replace word under cursor",
            mode = "n",
        },
        {
            "<leader>gf",
            function()
                vim.lsp.buf.format()
            end,
            desc = "Format file",
            mode = "n",
        },
        {
            "<leader>gd",
            function()
                vim.lsp.buf.definition()
            end,
            desc = "Go to definition",
            mode = "n",
        },
        {
            "<leader>gr",
            function()
                vim.lsp.buf.references()
            end,
            desc = "Find references",
            mode = "n",
        },
        {
            "<leader>ca",
            function()
                vim.lsp.buf.code_action()
            end,
            desc = "Code action",
            mode = "n",
        },
        {
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            desc = "Inspect symbol under cursor",
            mode = "n",
        },
        {
            "<leader><Space>",
            function()
                Snacks.picker.files({})
            end,
            desc = "Find files (Snacks)",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log({})
            end,
            desc = "Git Log",
        },
        {
            "<leader>tt",
            function()
                Snacks.picker.grep({
                    prompt = " ",
                    search = [[(?i)(^|\s+)TODO:?\s]],
                    regex = true,
                    live = false,
                    dirs = { vim.fn.getcwd() },
                    args = { "--no-ignore" },
                    on_show = function()
                        vim.cmd.stopinsert()
                    end,
                    finder = "grep",
                    format = "file",
                    show_empty = true,
                    supports_live = false,
                })
            end,
            desc = "Find to-do tasks",
        },
        {
            "<leader>kb",
            function()
                Snacks.picker.keymaps({})
            end,
            desc = "Keymaps",
        },
    },
}
