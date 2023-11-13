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
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = { event = "msg_show", find = "Pattern" },
          view = "mini",
        },
        {
          filter = { event = "msg_show", find = "search hit" },
          opts = { skip = true },
        },
      },
    },
  },
}
