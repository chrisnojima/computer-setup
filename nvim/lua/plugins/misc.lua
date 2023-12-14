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
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      return {
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      }
    end,
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
          filter = { kind = "" },
          view = "mini",
        },
      },
    },
  },
}
