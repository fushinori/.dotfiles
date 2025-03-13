local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local on_attach = unpack(require("phoenix.lsp.common"))

-- Sources
local eslint_actions = require("none-ls.code_actions.eslint_d").with({
  extra_filetypes = { "astro" },
})
local eslint_diagnostics = require("none-ls.diagnostics.eslint_d").with({
  extra_filetypes = { "astro" },
})
local prettierd = null_ls.builtins.formatting.prettierd.with({
  extra_filetypes = { "astro" },
})

local stylua = null_ls.builtins.formatting.stylua

local sources = { eslint_actions, eslint_diagnostics, prettierd, stylua }

null_ls.setup({
  on_attach = on_attach,
  sources = sources,
})
