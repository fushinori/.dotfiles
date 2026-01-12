local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local utils = require("null-ls.utils")
local on_attach = unpack(require("phoenix.lsp.common"))

-- Helpers
local function has_any_file(root, files)
  if not root then
    return false
  end

  for _, file in ipairs(files) do
    if vim.fn.filereadable(root .. "/" .. file) == 1 then
      return true
    end
  end

  return false
end

local function has_eslint_config(root)
  return has_any_file(root, {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
  })
end

local function has_prettier_config(root)
  return has_any_file(root, {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.js",
    ".prettierrc.cjs",
    "prettier.config.js",
    "prettier.config.cjs",
    "prettier.config.mjs",
  })
end

-- Sources
local sources = {}

-- Stylua
table.insert(sources, null_ls.builtins.formatting.stylua)

local root = utils.get_root()

-- Prettier
if has_prettier_config(root) then
  table.insert(
    sources,
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { "astro" },
    })
  )
end

-- ESLint
if has_eslint_config(root) then
  table.insert(
    sources,
    require("none-ls.code_actions.eslint_d").with({
      extra_filetypes = { "astro" },
    })
  )

  table.insert(
    sources,
    require("none-ls.diagnostics.eslint_d").with({
      extra_filetypes = { "astro" },
    })
  )
end

-- Setup
null_ls.setup({
  on_attach = on_attach,
  sources = sources,
})
