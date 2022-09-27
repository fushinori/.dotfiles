-- Keybindings for telescope
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
keymap("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
keymap("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
