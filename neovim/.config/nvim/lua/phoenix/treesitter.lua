local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup({
    ensure_installed = { 'python', 'rust', 'css', 'html',
        'javascript', 'typescript', 'lua' },
    auto_install = true,
    highlight = { enable = true },
})
