return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 30,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
		
		-- Open Neo-tree on startup and focus main window
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				require("neo-tree.command").execute({ toggle = true })
				-- Wait briefly for neo-tree to open, then focus the main window
				vim.defer_fn(function()
					vim.cmd("wincmd p")  -- Go to previous window
				end, 10)
			end,
		})
	end,
}
