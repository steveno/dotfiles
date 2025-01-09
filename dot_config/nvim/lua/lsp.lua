--
-- Autocompletion
--
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
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

--
-- Keymaps
--
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = event.buf}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  end,
})

--
-- Borders around lsp popups
--
local _border = "single"

vim.diagnostic.config{
  float={border=_border}
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

--
-- Automatically en/disable diagnostics based on mode
--
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = {'n:i', 'v:s'},
  desc = 'Disable diagnostics in insert and select mode',
  callback = function(e) vim.diagnostic.disable(e.buf) end
})

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = 'i:n',
  desc = 'Enable diagnostics when leaving insert mode',
  callback = function(e) vim.diagnostic.enable(e.buf) end
})

--
-- Enable inlay hints (if available)
--
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable inlay hints',
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method('textDocument/inlayHint') then
      return
    end

    if vim.lsp.inlay_hint ~= nil then
        vim.lsp.inlay_hint.enable(true, {bufnr = event.buf})
    end
  end,
})

--
-- Capabilities
--
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

--
-- LSP - rust
--
require('lspconfig').rust_analyzer.setup({
  capabilities = lsp_capabilities,
})

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

--
-- LSP - go
--
require('lspconfig').gopls.setup({
  capabilities = lsp_capabilities,
})

vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"
vim.g.go_template_autocreate = "0"

require'lspconfig'.gopls.setup{}
