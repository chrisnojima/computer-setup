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
-- vim.cmd('colorscheme nightfly')

-- Errors
vim.highlight.create('LspDiagnosticsVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
vim.highlight.create('DiagnosticVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);

-- Warnings
vim.highlight.create('LspDiagnosticsVirtualTextWarning', { guifg = "Yellow", ctermfg = "Yellow" }, false);
vim.highlight.create('DiagnosticVirtualTextWarn', { guifg = "Yellow", ctermfg = "Yellow" }, false);

-- Info & Hints
vim.highlight.create('DiagnosticVirtualTextInfo', { guifg = "White", ctermfg = "White" }, false);
vim.highlight.create('DiagnosticVirtualTextHint', { guifg = "White", ctermfg = "White" }, false);

-- Cursor line
vim.highlight.create('CursorLineNR', { guifg = "Yellow", ctermfg = "Yellow", guibg = "None", cterm = "bold" }, false);

-- Comment in italics
vim.highlight.create('Comment', { gui = "italic", cterm = "italic" }, false);

-- Change color of floating popup border
vim.highlight.link('FloatBorder', 'NightflyRed', true);

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
vim.g.mapleader = ','

-- center search
local map = vim.api.nvim_set_keymap
map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})
-- center opening results
map('n', ':cn', ':cn<CR>zz', {noremap = true})
-- change dir
map('', '<leader>cd', ':cd %:p:h<CR>', {noremap = true})
-- map('', '<leader>n', '<c-w>w', {noremap = true})
-- close other
map('', '<leader>o', '<c-w>o<cr>', {noremap = true})
-- close current tab
map('', '<leader>t', ':tabc<cr>', {noremap = true})

-- write
-- map('', '<leader>w',  ':w<cr>', {noremap = true})
-- close other tabs
map('', '<leader>to',  ':tabo<cr>', {noremap = true})
-- window movement
map('', '<leader>h',  ':wincmd h<CR>', {noremap = true})
map('', '<leader>j',  ':wincmd j<CR>', {noremap = true})
map('', '<leader>k',  ':wincmd k<CR>', {noremap = true})
map('', '<leader>l',  ':wincmd l<CR>', {noremap = true})

-- map('n', 's', '<Plug>Lightspeed_s', {noremap = true})
-- map('n', 'S', '<Plug>Lightspeed_S', {noremap = true})

vim.cmd [[
    " Key maps
    :command! Q :qa!
    :command! -nargs=1 S Rg -g '*.tsx' -g '*.d.ts' <q-args> ..
]]
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.treesitter.rainbow = {
  enable = true

}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  -- "bash",
  -- "c",
  "javascript",
  "json",
  "lua",
  -- "python",
  "typescript",
  "css",
  -- "rust",
  -- "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
     exe = "prettier",
     filetypes = {
      "typescriptreact",
      "typescript",
    }
  }
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
     exe = "eslint",
     filetypes = {
      "typescriptreact",
      "typescript",
    }
  }
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "ggandor/lightspeed.nvim" },
  { "p00f/nvim-ts-rainbow" },
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
  {'bluz71/vim-nightfly-guicolors'}
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


vim.cmd(":cd /Users/chrisnojima/go/src/github.com/keybase/client/shared")
