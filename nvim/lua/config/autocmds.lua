-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- fix netrw eating shift-h and shift-l
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "netrw" },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<S-h>", "<cmd>bprevious<cr>", { silent = false })
    vim.api.nvim_buf_set_keymap(0, "n", "<S-l>", "<cmd>bnext<cr>", { silent = false })
  end,
})
