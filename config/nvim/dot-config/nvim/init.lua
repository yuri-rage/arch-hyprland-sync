vim.wo.number = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.termguicolors = true

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
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#46b6d2" })

-- keybindings are in lua/plugins/keybinds.lua
-- and when you forget what they are, do <leader>kb (spacebar for leader)