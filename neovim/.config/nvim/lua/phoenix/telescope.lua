local status = pcall(require, "telescope")
if not status then
  return
end

-- Keybindings for telescope
local keymap = vim.keymap.set
local opts = { noremap = true }

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
keymap("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
keymap("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap("n", "<leader>dd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "<leader>lt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", opts)
