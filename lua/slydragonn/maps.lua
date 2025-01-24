-- Set leader key to comma
vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Git mappings
map("n", "<leader>b", "<cmd>Git blame<cr>")
map("n", "<leader>L", "<cmd>!clear && git log -p %<cr>")
map("n", "<leader>d", "<cmd>!clear && git diff %<cr>")

-- Previous file
map("n", "<leader>p", "<C-^>")

-- Quickfix navigation
map("n", "[q", "<cmd>cprevious<cr>")
map("n", "]q", "<cmd>cnext<cr>")
map("n", "<leader>q", "<cmd>cg quickfix.out | cwindow<cr>")

-- Clear search highlighting
map("n", "<C-l>", "<cmd>nohlsearch<cr>")

-- Spell check toggle
map("n", "<F5>", "<cmd>setlocal spell! spelllang=en_us<cr>")
map("i", "<F5>", "<cmd>setlocal spell! spelllang=en_us<cr>")

-- Disable F1 help
map("n", "<F1>", "<cmd>echo<cr>")
map("i", "<F1>", "<c-o>:echo<cr>")

-- Visual mode dot command
map("v", ".", ":norm.<cr>")

-- Window management
map("n", "<Tab>", "<C-w><C-w>")
map("n", "<leader>mw", "<cmd>lua vim.w.marked_window = vim.fn.winnr()<cr>")
map("n", "<leader>pw", "<cmd>lua local cur = vim.fn.winnr(); vim.cmd(vim.w.marked_window..'wincmd w'); local marked = vim.fn.bufnr('%'); vim.cmd('hide buf '..vim.fn.bufnr('%', cur..'wincmd w')..' hide buf '..marked)<cr>")

-- Number toggle
map("n", "<C-n>", function()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
    else
        vim.wo.relativenumber = true
    end
    vim.wo.number = true
end)

-- Formatting mappings
map("n", "<leader>=", "<cmd>Tabularize / =<cr>")
map("n", "<leader>:", "<cmd>Tabularize /:<cr>")
map("n", "<leader>ho", "<cmd>Tabularize /=><cr>")
map("n", "<leader>hn", "<cmd>Tabularize/\\w:\\zs/l0l1<cr>`")
map("n", "<leader>w", "<cmd>%s/\\s\\+$//e<cr>:nohl<cr>")

-- Ruby specific
map("n", "<leader>[", "<cmd>Bashrockets<cr>")
map("n", "<leader>]", "<cmd>Hashrockets<cr>")

-- Telescope mappings (replacing CtrlP)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>")

-- RuboCop
map("n", "<leader>z", "<cmd>RuboCop -A<cr>")

-- Custom functions
vim.cmd([[
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':Move ' . new_name
    endif
endfunction
]])
map("n", "<leader>n", "<cmd>lua vim.fn.RenameFile()<cr>")

-- DBT integration
vim.cmd([[
function! RunDBTWithTslime()
    let l:buffer_name = expand('%:t:r')
    let l:subdir = 'mindoula_dbt_athena'
    let l:dbt_command = 'original_dir=$(pwd) && cd ' . l:subdir . ' && dbt run -m ' . l:buffer_name . ' ; cd "$original_dir"'
    call Send_to_Tmux(l:dbt_command . "\n")
endfunction
]])
map("n", "<leader>x", "<cmd>lua vim.fn.RunDBTWithTslime()<cr>")

-- Directory mapping
vim.cmd([[
cnoremap %% <C-R>=expand('%:h').'/'<cr>
]])
