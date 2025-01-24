return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warm',
        term_colors = true,
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
      }
      require('onedark').load()

      -- Mode-based statusline colors
      vim.cmd([[
        au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
        au InsertLeave * hi StatusLine ctermbg=0 ctermfg=2
      ]])
    end,
  },
}
