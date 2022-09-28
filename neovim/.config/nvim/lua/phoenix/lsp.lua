local mason_status, mason = pcall(require, 'mason')
if (not mason_status) then return end

local mason_lsp_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not mason_lsp_status) then return end

mason.setup()
mason_lspconfig.setup()

local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not status) then return end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if (not lspconfig_status) then return end

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'rust_analyzer', 'pyright', 'html', 'emmet_ls', 'sumneko_lua', 'cssls', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Lua 
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  }
}

-- Rust 
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust_analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}

-- luasnip setup
local luasnip_status, luasnip = pcall(require, 'luasnip')
if (not luasnip_status) then return end

-- nvim-cmp setup
local cmp_status, cmp = pcall(require, 'cmp')
if (not cmp_status) then return end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
