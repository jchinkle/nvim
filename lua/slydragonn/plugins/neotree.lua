return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 30,
			},
			filesystem = {
				follow_current_file = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
		
		-- Open Neo-tree on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				require("neo-tree.command").execute({ toggle = true })
			end,
		})
	end,
}
