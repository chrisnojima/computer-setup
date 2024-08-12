return {
  { "bluz71/vim-nightfly-guicolors" }, -- color scheme
  { "LazyVim/LazyVim", opts = { colorscheme = "nightfly" } },
  { "echasnovski/mini.comment", version = "*" },
  { "rcarriga/nvim-notify", opts = { render = "compact" } },
  { "echasnovski/mini.pairs", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = { enabled = false },
        char = { enabled = false },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<space>"] = "none",
          ["P"] = function(state)
            local node = state.tree:get_node()
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end,
        },
      },
    },
  },
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
        {
          filter = {
            event = "notify",
            find = "Request textDocument/inlayHint failed",
          },
          opts = { skip = true },
        },
        {
          filter = { kind = "" },
          view = "mini",
        },
      },
    },
  },
}
