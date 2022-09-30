local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if (not lspconfig_status) then return end

local on_attach, capabilities = unpack(require("phoenix.lsp.common"))

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust_analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
