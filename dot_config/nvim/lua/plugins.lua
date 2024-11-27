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
    { "fatih/vim-go" },
    -- other
    { "junegunn/fzf", name = "fzf", dir = "~/.fzf", build = "./install --all" },
    { "yorickpeterse/vim-paper", lazy = true },
})

------------------------------------------------------
-- Plugin settings
------------------------------------------------------

-- Autocompletion
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({}),
})

-- Language Server keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').gopls.setup({
  capabilities = lsp_capabilities,
})

require('lspconfig').rust_analyzer.setup({
  capabilities = lsp_capabilities,
})

-- LSP - rust
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

-- LSP - go
vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"
vim.g.go_template_autocreate = "0"

require'lspconfig'.gopls.setup{}
