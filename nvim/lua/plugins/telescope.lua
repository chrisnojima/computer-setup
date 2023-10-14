return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "Grep",
      },
      {
        "<leader>st",
        function()
          require("telescope.builtin").live_grep({})
        end,
        desc = "Grep",
      },
      {
        "<leader>su",
        "<cmd>Telescope resume<CR>",
        desc = "Last search",
      },
      {
        "<leader>sd",
        function()
          require("telescope.builtin").diagnostics({ default_text = ":error:" })
        end,
        "<cmd>Telescope resume<CR>",
        desc = "LSP error",
      },
      {
        "<leader>sw",
        function()
          require("telescope-live-grep-args.shortcuts").grep_word_under_cursor({ postfix = " -F -i" })
        end,
        "Search word under cursor",
      },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
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
