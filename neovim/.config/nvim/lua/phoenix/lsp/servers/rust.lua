local on_attach, capabilities = unpack(require("phoenix.lsp.common"))

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable("rust_analyzer")
