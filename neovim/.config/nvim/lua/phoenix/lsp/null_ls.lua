local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local on_attach = unpack(require("phoenix.lsp.common"))

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- Sources
local eslintd_actions = code_actions.eslint_d.with({
  extra_filetypes = { "astro" },
})
local eslintd_diagnostics = diagnostics.eslint_d.with({
  extra_filetypes = { "astro" },
})
local prettierd = formatting.prettierd.with({
  extra_filetypes = { "astro" },
})

local sources = { eslintd_actions, eslintd_diagnostics, prettierd }

null_ls.setup({
  on_attach = on_attach,
  sources = sources
})
