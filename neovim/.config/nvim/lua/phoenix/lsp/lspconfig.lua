local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if (not lspconfig_status) then return end

local on_attach, capabilities = unpack(require("phoenix.lsp.common"))

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'html', 'emmet_ls', 'cssls', 'tsserver', 'astro', 'tailwindcss', 'svelte' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Common keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
