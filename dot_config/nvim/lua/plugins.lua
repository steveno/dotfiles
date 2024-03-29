-- Any copyright is dedicated to the Public Domain.
-- https://creativecommons.org/publicdomain/zero/1.0/

-- Function to install lazy if it's not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

require("lazy").setup({
    "bling/vim-airline",
    "bhurlow/vim-parinfer",
    "jaawerth/fennel.vim",
    "Olical/conjure",
    "Olical/aniseed",
    { "yorickpeterse/vim-paper", lazy = true },
    { "junegunn/fzf", name = "fzf", dir = "~/.fzf", build = "./install --all" },
    { "fatih/vim-go" },
})

------------------------------------------------------
-- Plugin settings
------------------------------------------------------

-- go
vim.cmd([[
    autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
]])

vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"

vim.g['conjure#client#fennel#aniseed#aniseed_module_prefix'] = "aniseed."
