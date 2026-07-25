--
-- Keymaps
--
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<cr>')
  end,
})

--
-- Borders around lsp popups
--
local _border = "single"

vim.diagnostic.config{
  float={border=_border}
}

--
-- Automatically en/disable diagnostics based on mode
--
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = {'n:i', 'v:s', 'i:n'},
  desc = 'Disable diagnostics in insert and select mode',
  callback = function(e) vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end
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
-- LSP
--
vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"
vim.g.go_template_autocreate = "0"

