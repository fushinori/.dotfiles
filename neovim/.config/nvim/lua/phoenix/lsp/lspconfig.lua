local on_attach, capabilities = unpack(require("phoenix.lsp.common"))

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  "pyright",
  "html",
  "emmet_ls",
  "ts_ls",
  "astro",
  "tailwindcss",
  "svelte",
  "cssmodules_ls",
  "css_variables",
}
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
  })

  vim.lsp.enable(lsp)
end

-- Common keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
  desc = "LSP signature help",
})
