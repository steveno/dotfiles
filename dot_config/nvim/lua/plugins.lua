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
    -- lsp
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    -- go
    { "fatih/vim-go",
      ft = { "go" },
      build = ":GoUpdateBinaries",
      config = function()
          vim.g.go_fmt_command = "gofmt"
          vim.g.go_imports_autosave = 1
          vim.g.go_mod_fmt_save = 1
          vim.g.go_def_mapping_enabled = 0
      end,
    },
    -- other
    { 'neoclide/coc.nvim', branch = 'release', },
})

require('lsp')

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.gentline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
