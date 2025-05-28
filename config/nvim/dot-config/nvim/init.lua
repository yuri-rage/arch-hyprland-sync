vim.wo.number = true
vim.opt.signcolumn = "yes"
vim.cmd("set cursorline")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.showmode = false

require("config.lazy")

-- show inline diagnostic (linter) text
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "◆",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
    --signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- keybindings are in lua/plugins/keybinds.lua
-- and when you forget what they are, do <leader>kb (spacebar for leader)
