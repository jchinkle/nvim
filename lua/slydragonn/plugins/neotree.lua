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
				-- Disable line numbers in the neo-tree window
				vim.defer_fn(function()
					local wins = vim.api.nvim_list_wins()
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
						if ft == 'neo-tree' then
							local win_id = win
							vim.api.nvim_win_set_option(win_id, 'number', false)
							vim.api.nvim_win_set_option(win_id, 'relativenumber', false)
						end
					end
					vim.cmd("wincmd p")  -- Go to previous window
				end, 10)
			end,
		})
	end,
}
