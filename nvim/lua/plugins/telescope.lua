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
            "/node_modules/",
            "/osx/",
            "/packaging/",
            "/protocol/",
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
            },
            -- for normal mode
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
            },
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
    after = { "nvim-telescope/telescope.nvim" },
  },
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
