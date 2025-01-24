return {
  -- Git Integration
  {
    "tpope/vim-fugitive",
    cmd = {"Git", "G"},
  },

  -- Essential Tools
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "tpope/vim-commentary",
    event = "VeryLazy",
  },
  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },

  -- Tmux Integration
  {
    "jgdavey/tslime.vim",
    config = function()
      vim.g.tslime_always_current_session = 1
      vim.g.tslime_always_current_window = 1
    end
  },

  -- Search in files (like :Ack)
  {
    "mileszs/ack.vim",
    cmd = "Ack",
    config = function()
      -- Use ripgrep instead of ack
      vim.g.ackprg = 'rg --vimgrep --smart-case --hidden'
      
      -- Don't jump to first match
      vim.g.ack_autoclose = 0
      vim.g.ack_autofold_results = 0
      
      -- Highlight search term in quickfix window
      vim.g.ackhighlight = 1
    end,
  },

  -- Language Support
  {
    "vim-test/vim-test",
    dependencies = { "jgdavey/tslime.vim" },
    keys = {
      { "<leader>t", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>T", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>r", "<cmd>TestSuite<cr>", desc = "Test suite" },
      { "<leader>l", "<cmd>TestLast<cr>", desc = "Test last" },
    },
    config = function()
      vim.g['test#strategy'] = 'tslime'
      vim.g['test#preserve_screen'] = 1
      vim.g['test#echo_command'] = 0
      vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit'
      vim.g['test#javascript#jest#executable'] = 'npx jest'
      vim.g['test#ruby#rspec#options'] = {
        ['all'] = ' --color --format Fuubar --require ~/quickfix.rb --format QuickfixFormatter --out quickfix.out'
      }
    end,
  },
  {
    "hashivim/vim-terraform",
    ft = "terraform",
  },
  {
    "tpope/vim-rails",
    ft = {"ruby", "eruby", "haml", "slim"},
  },
}
