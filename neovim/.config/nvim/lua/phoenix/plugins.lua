return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP Stuff
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
    'rafamadriz/friendly-snippets' -- Snippets collection
  }

  -- Guess indentation style and use it
  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end
  }

  -- Show indentation guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- Automatically insert pairs of parentheses, quotes etc
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- Make it easier to add comments in code
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup {} end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Statusline
  use 'windwp/windline.nvim'

  -- Use Neovim as a language server to inject LSP diagnostics,
  -- code actions, and more via Lua.
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

end)
