return {
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,  -- Load immediately
        cmd = 'Telescope',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                    preview = false,  -- Disable preview for speed
                    layout_strategy = 'bottom_pane',
                    layout_config = {
                        height = 0.4,  -- 40% of screen
                    },
                },
            })

            -- Keymaps
            vim.keymap.set('n', '<C-p>', builtin.find_files, { silent = true })
            vim.keymap.set('n', '<leader>f', builtin.find_files, { silent = true })
            vim.keymap.set('n', '<leader>b', builtin.buffers, { silent = true })
            vim.keymap.set('n', '<leader>g', builtin.live_grep, { silent = true })
            vim.keymap.set('n', '<leader>*', builtin.grep_string, { silent = true })
        end,
    }
}
