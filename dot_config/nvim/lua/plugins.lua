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
    -- nvim setup
    "bling/vim-airline",
    "bhurlow/vim-parinfer",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- fennel
    "jaawerth/fennel.vim",
    "Olical/conjure",
    "Olical/aniseed",
    -- lsp
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    -- go
    { "fatih/vim-go" },
    -- other
    { "junegunn/fzf", name = "fzf", dir = "~/.fzf", build = "./install --all" },
    { "yorickpeterse/vim-paper", lazy = true },
})

------------------------------------------------------
-- Plugin settings
------------------------------------------------------

-- go
vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"

-- aniseed
vim.g['conjure#client#fennel#aniseed#aniseed_module_prefix'] = "aniseed."

-- mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
