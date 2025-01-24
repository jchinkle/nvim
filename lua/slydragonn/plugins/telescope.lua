return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local telescope = require('telescope')
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git/" },
					layout_strategy = 'vertical',
					layout_config = {
						vertical = { width = 0.8, height = 0.8 }
					},
					preview = false -- Disable preview for speed
				}
			})

			-- Smart file finder that uses git_files in git repos
			local function project_files()
				local opts = {} -- define here if you want to define something
				local ok = pcall(require'telescope.builtin'.git_files, opts)
				if not ok then require'telescope.builtin'.find_files(opts) end
			end

			-- Key mappings
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', project_files, { silent = true })
			vim.keymap.set('n', '<leader>f', project_files, { silent = true })
			vim.keymap.set('n', '<leader>b', builtin.buffers, { silent = true })
			vim.keymap.set('n', '<leader>g', builtin.live_grep, { silent = true })
			vim.keymap.set('n', '<leader>*', function()
				builtin.grep_string({ search = vim.fn.expand("<cword>") })
			end, { silent = true })
		end,
	}
}
