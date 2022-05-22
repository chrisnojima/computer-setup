vim.opt.shell = "/bin/sh"
lvim.log.level = "warn"
lvim.format_on_save = {
  pattern = "*",
  timeout = 10000,
}
lvim.colorscheme = "nightfly"

vim.g.nightflyCursorColor         = 1
vim.g.nightflyUnderlineMatchParen = 0
vim.g.nightflyNormalFloat         = 1
vim.highlight.create('LspDiagnosticsVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
vim.highlight.create('DiagnosticVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
vim.highlight.create('LspDiagnosticsVirtualTextWarning', { guifg = "Yellow", ctermfg = "Yellow" }, false);
vim.highlight.create('DiagnosticVirtualTextWarn', { guifg = "Yellow", ctermfg = "Yellow" }, false);
vim.highlight.create('DiagnosticVirtualTextInfo', { guifg = "White", ctermfg = "White" }, false);
vim.highlight.create('DiagnosticVirtualTextHint', { guifg = "White", ctermfg = "White" }, false);
vim.highlight.create('CursorLineNR', { guifg = "Yellow", ctermfg = "Yellow", guibg = "None", cterm = "bold" }, false);
vim.highlight.create('Comment', { gui = "italic", cterm = "italic" }, false);
vim.highlight.link('FloatBorder', 'NightflyRed', true);

lvim.leader = ","
vim.g.mapleader = ','
-- resize windows
lvim.keys.normal_mode["<C-Up>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<C-Down>"] = ":resize -2<CR>"
-- legacy keys
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>nn"] = "<cmd>lua require'nvim-tree'.toggle()<CR>"
-- center on search
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.normal_mode["N"] = "Nzz"
lvim.keys.normal_mode[":cn"] = ":cn<CR>zz"
-- close other splits
lvim.keys.normal_mode["<leader>o"] = ":only<CR>"

-- useful telescope resume last search
lvim.keys.normal_mode["<leader>su"] = "<cmd>Telescope resume<CR>"
lvim.keys.normal_mode["<leader>sd"] = "<cmd>lua require('telescope.builtin').diagnostics({default_text = ':error:'})<CR>"

-- paste on top don't lose clipboard
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["P"] = '"_dP'

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- fast quit all
vim.api.nvim_create_user_command("Q", ":qa!", {})

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "%.circleci/",
  "%.png$",
  "/git%-hooks/",
  "/images/",
  "/ios/Pods/",
  "/media/",
  "/node_modules/",
  "/osx/",
  "/packaging/",
  "/protocol/",
  "/pvl%-tools"
}
lvim.builtin.telescope.defaults.mappings = {
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
}

lvim.builtin.alpha.mode = "startify"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- don't cwd to the current file
-- lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
-- lvim.builtin.nvimtree.setup.update_to_buf_dir.enable = true

lvim.builtin.treesitter.rainbow = { enable = true }

local _, gps = pcall(require, "nvim-gps")
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.sections.lualine_b = { { "filename", path = 1, shorting_target = 100 } }
lvim.builtin.lualine.sections.lualine_c = { { gps.get_location, cond = gps.is_available } }
lvim.builtin.lualine.sections.lualine_d = {}
lvim.builtin.lualine.sections.lualine_x = { components.diagnostics }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.automatic_servers_installation = false
lvim.lsp.null_ls.setup.debug = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "typescriptreact",
      "typescript",
      "javascript",
    }
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint_d",
    filetypes = {
      "typescriptreact",
      "typescript",
      "javascript",
    }
  }
}

lvim.plugins = {
  { "ggandor/lightspeed.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "nvim-gps".setup()
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.listchars = { space = "⋅", eol = "↴", }
      vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#555555  gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#333333  gui=nocombine]]
      require("indent_blankline").setup {
        buftype_exclude = { "terminal", "telescope" },
        filetype_exclude = { "help", "packer", "NvimTree", "Trouble", "alpha" },
        show_current_context = false,
        show_end_of_line = true,
        use_treesitter = true,
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
      }
    end
  }, -- indent marks
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup(
        { '*' },
        {
          RGB      = true; -- #RGB hex codes
          RRGGBB   = true; -- #RRGGBB hex codes
          names    = true; -- "Name" codes like Blue
          RRGGBBAA = true; -- #RRGGBBAA hex codes
          rgb_fn   = true; -- CSS rgb() and rgba() functions
          hsl_fn   = true; -- CSS hsl() and hsla() functions
          css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn   = true; -- Enable all CSS *functions*: rgb_fn, hsl_fn
        }
      )
    end
  }, -- make colors show
  {
    "folke/persistence.nvim", -- save sessions
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  { 'tpope/vim-abolish' }, --- smarter substitute and abbreviate
  { 'tpope/vim-fugitive' }, --- git integration
  { 'tpope/vim-repeat' }, --- repeat commands better
  { 'tpope/vim-surround' }, --- surround things better
  { 'tpope/vim-unimpaired' }, --- toggle mappings quicker
  { 'bluz71/vim-nightfly-guicolors' }, -- color scheme
}

local options = {
  autoindent = true,
  autoread = true,
  backspace = { "indent", "start", "eol" },
  diffopt = "vertical",
  errorbells = false,
  hidden = true,
  history = 700,
  inccommand = "split", -- realtime replace
  incsearch = true, -- incremental search
  laststatus = 2, -- always show the statusbar
  lazyredraw = true, -- buffers screen updates
  linebreak = true, -- linebreak
  magic = true, -- magic regexp options
  relativenumber = true, -- set relative numbered lines
  shiftwidth = 4, -- tab width
  showcmd = true, -- show current command on lower right, useful for leader
  showmatch = true, -- show matching brackets
  sidescrolloff = 8,
  spell = true, -- spellcheck
  splitbelow = false,
  splitright = false,
  suffixesadd = { ".tsx", ".native.tsx", ".d.ts", ".js" },
  tabstop = 4, -- tabs
  termguicolors = true, -- full colors
  timeoutlen = 500, -- defer which key some
  textwidth = 0, -- never linebreak
  virtualedit = "block", -- visual block anywhere
  visualbell = false, -- no sounds
  wildignore = "*node_modules/**", -- ignore
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd(":cd /Users/chrisnojima/go/src/github.com/keybase/client/shared")
vim.api.nvim_create_user_command("Kdebug", ":e ~/Library/Logs/Keybase.app.debug ", {})
vim.api.nvim_create_user_command("JSON", ":%! jq .", {})
