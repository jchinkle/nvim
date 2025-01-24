local global = vim.g
local o = vim.opt

-- Set GUI Font for Neovim
o.guifont = "DejaVuSansM Nerd Font:h12"

-- Core Settings
o.syntax = "on"
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.number = true
o.relativenumber = true
o.showmatch = true
o.ignorecase = true
o.hlsearch = true
o.cursorline = true
o.smartcase = true
o.incsearch = true
o.mouse = "a"
o.ttimeoutlen = 100
o.ruler = true
o.scrolloff = 2
o.laststatus = 2
o.wildmenu = true
o.wildmode = "list:longest,full"
o.listchars = { tab = ">-", trail = "~", extends = ">", precedes = "<" }
o.list = true
o.background = "dark"
o.termguicolors = true

-- Folding settings
o.foldmethod = "manual"
o.foldnestmax = 10
o.foldenable = false
o.foldlevel = 1

-- Color column
o.colorcolumn = "120"

-- Persistent undo
o.undofile = true
vim.cmd([[set undodir=~/.config/nvim/undodir]])

-- File type specific settings
vim.cmd([[
augroup python_files
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0 expandtab autoindent fileformat=unix
augroup END

augroup web_files
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
]])
