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
-- close tabs
lvim.keys.normal_mode["<leader>o"] = "<c-w>o<cr>"
lvim.keys.normal_mode["<leader>t"] = ":tabc<cr>"
lvim.keys.normal_mode["<leader>to"] =  ":tabo<cr>"

lvim.keys.normal_mode["<leader>gt"] =  ":TroubleToggle<cr>"
-- paste on top don't lose clipboard
lvim.keys.visual_mode["p"] =  '"_dP'
lvim.keys.visual_mode["P"] =  '"_dP'

vim.cmd [[
    " Key maps
    :command! Q :qa!
    :command! -nargs=1 S Rg -g '*.tsx' -g '*.d.ts' <q-args> ..
]]

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "^%.circleci/",
  "^%.png$",
  "^browser/",
  "^git%-hooks/",
  "^go/",
  "^images/",
  "^ios/Pods",
  "^media/",
  "^node_modules/",
  "^osx/",
  "^packaging/",
  "^protocol/",
  "^pvl%-tools"
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

lvim.builtin.dashboard.active = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.project.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.treesitter.rainbow = { enable = true }
local components = require "lvim.core.lualine.components"
local gps = require("nvim-gps")
lvim.builtin.lualine.sections.lualine_b = { {"filename", path = 1, shorting_target = 100} }
lvim.builtin.lualine.sections.lualine_c = { {gps.get_location, cond = gps.is_available }}
lvim.builtin.lualine.sections.lualine_d = { }
lvim.builtin.lualine.sections.lualine_x = { components.diagnostics }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "json",
  "lua",
  "typescript",
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
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "ggandor/lightspeed.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
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
        buftype_exclude = {"terminal", "telescope"},
        filetype_exclude = {"help", "dashboard", "packer", "NvimTree", "Trouble"},
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
        {'*'},
        {
          RGB      = true;         -- #RGB hex codes
          RRGGBB   = true;         -- #RRGGBB hex codes
          names    = true;         -- "Name" codes like Blue
          RRGGBBAA = true;         -- #RRGGBBAA hex codes
          rgb_fn   = true;         -- CSS rgb() and rgba() functions
          hsl_fn   = true;         -- CSS hsl() and hsla() functions
          css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
        }
      )
    end
  }, -- make colors show
  {'tpope/vim-abolish'}, --- smarter substitute and abbreviate
  {'tpope/vim-fugitive'}, --- git integration
  {'tpope/vim-repeat'}, --- repeat commands better
  {'tpope/vim-surround'}, --- surround things better
  {'tpope/vim-unimpaired'}, --- toggle mappings quicker
  {'bluz71/vim-nightfly-guicolors'},
  {'SmiteshP/nvim-gps', config = function()
    require("nvim-gps").setup({
      icons = {
        ["class-name"] = ' ',      -- Classes and class-like objects
        ["function-name"] = ' ',   -- Functions
        ["method-name"] = ' '      -- Methods (functions inside class-like objects)
      },
      languages = { ["html"] = false, },
      separator = ' > ',
    })
  end
    }
}

local options = {
  autoindent = true,
  autoread = true,
  backspace = {"indent","start","eol"} ,
  diffopt = "vertical" ,
  errorbells = false,
  hidden = true,
  history = 700 ,
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
  suffixesadd = {".tsx", ".native.tsx", ".d.ts", ".js"},
  tabstop = 4, -- tabs
  termguicolors = true, -- full colors
  textwidth = 0, -- never linebreak
  virtualedit = "block", -- visual block anywhere
  visualbell = false, -- no sounds
  wildignore = "*node_modules/**", -- ignore
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd(":cd /Users/chrisnojima/go/src/github.com/keybase/client/shared")
