local logo = vim.fn.readfile(vim.fn.stdpath("config") .. "/assets/logo.txt")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = table.concat(logo, "\n"),
			},
		},
		explorer = { enabled = true },
		image = {
			enabled = true,
			doc = {
				inline = false,
				float = true,
				max_width = 60,
				max_height = 30,
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		lazygit = {
			enabled = true,
		},
		notifier = { enabled = true },
		picker = { enabled = true, frecency = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		styles = {
			snacks_image = {
				relative = "editor",
				col = -1,
			},
		},
		words = { enabled = true },
	},
}
