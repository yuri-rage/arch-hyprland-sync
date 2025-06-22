return {
    "yuri-rage/nvim-keybind-tracker",
    event = "VeryLazy",
    config = function()
        require("keybind-tracker").setup({})
        local map = require("keybind-tracker").map
        local harpoon = require("harpoon")

        -- untracked convenience keybinds
        vim.keymap.set("n", "Q", "<nop>")                                      -- disable Ex mode
        vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true }) -- clear search on ESC

        -- motions
        map("n", "<C-u>", "<C-u>zz", { desc = "PgUp + center cursor" })
        map("n", "<C-d>", "<C-d>zz", { desc = "PgDn + center cursor" })
        map("v", "K", "<CMD>m '<-2<CR>gv=gv", { desc = "Move visual block up" })
        map("v", "J", "<CMD>m '>+1<CR>gv=gv", { desc = "Move visual block down" })

        -- substitution
        map(
            "n",
            "<leader>s",
            [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
            { desc = "Global replace word under cursor", group = "Substitution" }
        )

        --clipboard
        map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank (to system clipboard)", group = "Clipboard" })
        map("n", "<leader>Y", [["+Y]], { desc = "Yank to EOL (system clipboard)", group = "Clipboard" })
        map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete (no yank)", group = "Clipboard" })
        map("x", "<leader>p", [["_dP]], { desc = "Paste (no yank)", group = "Clipboard" })

        -- Neo-tree
        map("n", "<C-n>", "<CMD>Neotree filesystem toggle left<CR>", { desc = "Toggle Neotree", group = "Filesystem" })

        -- Telescope
        -- local builtin = require("telescope.builtin")
        -- map("n", "<C-p>", builtin.find_files, { desc = "Find files (Telescope)", group = "Filesystem" })
        -- map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", group = "Filesystem" })

        -- fzf-lua
        map("n", "<C-p>", require("fzf-lua").files, { desc = "Find files (fzf)", group = "Filesystem" })
        map("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Live grep (fzf)", group = "Filesystem" })

        -- Oil
        map("n", "<leader>oi", "<CMD>Oil --float<CR>", { desc = "Edit filesystem (Oil)", group = "Filesystem" })

        -- Harpoon
        map("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon add", group = "Filesystem" })
        map("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon toggle list", group = "Filesystem" })
        map("n", "<leader>hp", function()
            harpoon:list():prev()
        end, { desc = "Harpoon previous file", group = "Filesystem" })
        map("n", "<leader>hn", function()
            harpoon:list():next()
        end, { desc = "Harpoon nest file", group = "Filesystem" })

        -- LSP
        map("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file", group = "LSP" })
        map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition", group = "LSP" })
        map("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references", group = "LSP" })
        map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", group = "LSP" })
        map("n", "K", vim.lsp.buf.hover, { desc = "Inspect symbol under cursor", group = "LSP" })

        -- Gitsigns
        map("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "Git: preview hunk", group = "Git" })
        map(
            "n",
            "<leader>gt",
            "<CMD>Gitsigns toggle_current_line_blame<CR>",
            { desc = "Git: toggle blame", group = "Git" }
        )
    end,
}
