return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sd",
        function()
          require("telescope.builtin").diagnostics({ default_text = ":error:" })
        end,
        "<cmd>Telescope resume<CR>",
        desc = "LSP error",
      },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          path_display = { shorten = 5 },
          file_ignore_patterns = {
            "%.circleci/",
            "%.png$",
            "%.svg$",
            "/git%-hooks/",
            "/images/",
            "/ios/Pods/",
            "/media/",
            "/osx/",
            "/pvl%-tools",
          },
          sorting_strategy = "ascending",
          mappings = {
            -- for input mode
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
            },
            -- for normal mode
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
            },
          },
        },
      }
    end,
  },
}
