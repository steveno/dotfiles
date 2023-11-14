-- Any copyright is dedicated to the Public Domain.
-- https://creativecommons.org/publicdomain/zero/1.0/

vim.opt.laststatus = 2

-- Show full tags when doing search completion
vim.opt.showfulltag = true
vim.opt.expandtab = true

-- Speed up macros
vim.opt.lazyredraw = true

-- No error noises
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Try to show at least three lines and two columns of
-- context when scrolling
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 2

-- Wrap and match
vim.opt.whichwrap:append("<,>,[,]")
vim.opt.matchpairs:append("<:>")

-- Print with syntax highlighting and line numbers
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Turn off highlighting
vim.opt.hls = false

-- Disable line wrapping
vim.opt.wrap = false

-- Show us the command we're typing
vim.opt.showcmd = true

-- Highlight matching parens
vim.opt.showmatch = true

-- Set a dark background
vim.opt.number = true
vim.opt.numberwidth = 3

-- Allow hidden buffers
vim.opt.hidden = true

-- Create backups
vim.opt.backup = true
vim.cmd([[
    try
        set backupdir=$HOME/.local/share/nvim/backups/
        set directory=$HOME/.local/share/nvim/backups/
    catch
    endtry
]])

-- color scheme
vim.cmd([[
    if exists('+termguicolors')
        let &t_8f =  "\<Esc>[38:2;%lu;%lu;%lum"
        let &t_8b =  "\<Esc>[48:2;%lu;%lu;%lum"
        set t_Co=256
        set termguicolors
        colorscheme paper
    endif
]])

-- Python
vim.g.python3_host_prog = "/usr/bin/python3"

