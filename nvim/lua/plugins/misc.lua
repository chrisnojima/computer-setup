return {
  { "bluz71/vim-nightfly-guicolors" }, -- color scheme
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "nightfly" },
  },
  { "echasnovski/mini.comment", version = "*" },
  {
    "rcarriga/nvim-notify",
    opts = { render = "compact" },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = { enabled = false },
        char = { enabled = false },
      },
    },
  },
  { "folke/todo-comments.nvim", enabled = false },
  {
    "echasnovski/mini.bufremove",
    -- add ,c to close but try and move to ,bd
    keys = {
      {
        "<leader>c",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
}
