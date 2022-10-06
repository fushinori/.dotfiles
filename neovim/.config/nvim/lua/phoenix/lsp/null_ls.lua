local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local on_attach = unpack(require("phoenix.lsp.common"))

local formatting = null_ls.builtins.formatting

local prettierd = formatting.prettierd.with({
  extra_filetypes = { "astro" },
})

local sources = { prettierd }

null_ls.setup({
  on_attach = on_attach,
  sources = sources
})
