local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not status) then return end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

return {
  on_attach = on_attach,
  capabilities = capabilities
}
