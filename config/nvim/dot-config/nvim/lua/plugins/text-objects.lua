return {
	"echasnovski/mini.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("mini.ai").setup()

		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
						["al"] = "@comment.outer",
						["il"] = "@comment.inner",
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",
						["ao"] = "@loop.outer",
						["io"] = "@loop.inner",
						["ak"] = "@call.outer",
						["ik"] = "@call.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]p"] = "@parameter.outer",
						["]i"] = "@conditional.outer",
						["]o"] = "@loop.outer",
						["]k"] = "@call.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]P"] = "@parameter.outer",
						["]I"] = "@conditional.outer",
						["]O"] = "@loop.outer",
						["]K"] = "@call.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[p"] = "@parameter.outer",
						["[i"] = "@conditional.outer",
						["[o"] = "@loop.outer",
						["[k"] = "@call.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[P"] = "@parameter.outer",
						["[I"] = "@conditional.outer",
						["[O"] = "@loop.outer",
						["[K"] = "@call.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
