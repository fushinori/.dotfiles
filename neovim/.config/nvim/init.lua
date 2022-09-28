local cmd = vim.cmd -- execute vim commands
local o = vim.o -- :set options

require("phoenix")

-- Be able to use mouse
o.mouse = "a"

-- Relative line numbers and current absolute line number
o.relativenumber = true
o.number = true

-- Copy and paste using system clipboard
o.clipboard = "unnamedplus"

-- True colour
cmd([[
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]])

-- Gruvbox colorscheme
cmd([[
let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
]])

-- Highlight current line number
o.cursorline = true
o.cursorlineopt = "number"
cmd("hi CursorLineNr gui=bold") -- make line number bold

-- Don't show mode (eg: -- INSERT --)
o.showmode = false

-- Treesitter folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99 -- All folds open by default
