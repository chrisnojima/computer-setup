-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>only<cr>")
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("v", "P", '"_dP')

vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>")
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>")
