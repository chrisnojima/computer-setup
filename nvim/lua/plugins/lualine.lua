return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")
      opts.sections.lualine_x = {
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.mode.has()
          end,
          color = Util.ui.fg("Constant"),
        },
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = Util.ui.fg("Special"),
        },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
        },
      }
      opts.sections.lualine_y = {
        { "progress", separator = "", padding = { left = 0, right = 0 } },
        { "location", padding = { left = 0, right = 0 } },
      }
      opts.sections.lualine_z = {}
    end,
  },
}
