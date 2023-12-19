-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.shell = "/bin/sh"
vim.g.mapleader = ","

local options = {
  cmdheight = 0,
  conceallevel = 0, -- don't hide quotes in json etc
  errorbells = false,
  history = 700,
  inccommand = "split", -- realtime replace
  relativenumber = true, -- set relative numbered lines
  shiftwidth = 4, -- tab width
  spell = true, -- spellcheck
  suffixesadd = { ".tsx", ".native.tsx", ".d.ts", ".js", "/index.tsx" },
  tabstop = 4, -- tabs
  termguicolors = true, -- full colors
  timeoutlen = 500, -- defer which key some
  virtualedit = "block", -- visual block anywhere
  wildignore = "*node_modules/**", -- ignore
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd(":packadd cfilter")
vim.cmd([[autocmd FileType typescript,typescriptreact compiler tsc | setlocal makeprg=yarn\ tsc]])

vim.api.nvim_create_user_command("Q", ":qa!", {})
vim.api.nvim_create_user_command("Kdebug", ":e ~/Library/Logs/Keybase.app.debug ", {})
vim.api.nvim_create_user_command("ZSH", ":e ~/.zshrc", {})
vim.api.nvim_create_user_command("JSON", ":set ft=json|:%! jq .", {})
vim.api.nvim_create_user_command("Kcd", ":cd /Users/chrisnojima/go/src/github.com/keybase/client/shared", {})

-- vim.cmd(":Kcd")

function find_and_open_buffers(pattern)
  -- Step 1: Get the list of files containing the pattern using Ripgrep (rg -l)
  local command = string.format("rg -i -l '%s'", pattern)
  local output = vim.fn.systemlist(command)

  -- Step 2: Open the files as buffers using :next
  if #output > 0 then
    local buffer_list = table.concat(output, " ")
    vim.cmd("next " .. buffer_list)
  else
    print("No matching files found.")
  end
end

-- Define a command that calls our Lua function
vim.api.nvim_command("command! -nargs=1 Rg lua find_and_open_buffers(<q-args>)")
