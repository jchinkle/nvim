return {
  -- LSP and Completion (replaces YouCompleteMe, syntastic, vim-easycomplete, supertab)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  
  -- Treesitter (better syntax highlighting - replaces various language plugins)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "javascript", "typescript", "ruby", "python",
          "tsx", "json", "yaml", "css", "html", "markdown",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Status line (replaces vim-airline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "solarized_dark",
        },
      })
    end,
  },

  -- Better formatting (replaces tabular)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          ruby = { "rubocop" },
        },
      })
    end,
  },
}
