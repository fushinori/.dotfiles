local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope git status" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope git branches" })
vim.keymap.set("n", "<leader>dd", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP references" })
vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Telescope LSP type definitions" })

telescope.load_extension("file_browser")

-- Open file browser at the current buffer
vim.keymap.set("n", "<leader>fb", function()
  require("telescope").extensions.file_browser.file_browser({
    cwd = vim.fn.expand("%:p:h"),
    select_buffer = true,
    hidden = true,
  })
end, { desc = "Telescope file browser" })

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "%.git/" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
})
