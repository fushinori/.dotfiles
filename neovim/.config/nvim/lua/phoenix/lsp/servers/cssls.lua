local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if (not lspconfig_status) then return end
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not status) then return end

local on_attach = unpack(require("phoenix.lsp.common"))

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Add additional capabilities supported by nvim-cmp
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

lspconfig.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
