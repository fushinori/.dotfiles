local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if (not lspconfig_status) then return end

local cmn = require("phoenix.lsp.common")
local on_attach, capabilities = cmn.on_attach, cmn.capabilities

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
