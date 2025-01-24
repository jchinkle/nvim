return {
	{
		'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf' },
		config = function()
			-- Use git ls-files if in git repo, fall back to fd otherwise
			vim.env.FZF_DEFAULT_COMMAND = [[
				(git ls-files --cached --others --exclude-standard 2>/dev/null || 
				fd --type f --hidden --follow --exclude .git)
			]]
			
			-- Basic settings
			vim.g.fzf_layout = { down = '40%' }
			vim.g.fzf_preview_window = {}  -- Disable preview for speed
			vim.g.fzf_buffers_jump = 1
			
			-- Key mappings
			vim.keymap.set('n', '<C-p>', ':Files<CR>', { silent = true })
			vim.keymap.set('n', '<leader>f', ':Files<CR>', { silent = true })
			vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { silent = true })
			vim.keymap.set('n', '<leader>g', ':Rg<CR>', { silent = true })
			vim.keymap.set('n', '<leader>*', ':Rg <C-R><C-W><CR>', { silent = true })
		end,
	},
}
