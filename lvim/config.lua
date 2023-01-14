vim.opt.shell = "/bin/sh"
-- lvim.log.level = "debug"
lvim.log.level = "warn"
lvim.format_on_save = {
    enabled = true,
    pattern = "*",
    timeout = 10000,
}
lvim.colorscheme = "nightfly"

vim.g.nightflyCursorColor         = 1
vim.g.nightflyUnderlineMatchParen = 0
vim.g.nightflyNormalFloat         = 1

lvim.leader = ","
vim.g.mapleader = ','
-- resize windows
lvim.keys.normal_mode["<C-Up>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<C-Down>"] = ":resize -2<CR>"
-- legacy keys
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope find_files<CR>"
-- center on search
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.normal_mode["N"] = "Nzz"
lvim.keys.normal_mode[":cn"] = ":cn<CR>zz"

-- keep old buffer changes
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"

-- paste on top don't lose clipboard
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["P"] = '"_dP'

lvim.builtin.which_key.mappings["o"] = {"<cmd>only<CR>", "Close other panes"}
lvim.builtin.which_key.mappings["nn"] = {"<cmd>lua require'nvim-tree'.toggle()<CR>", "Open tree"}

lvim.builtin.which_key.mappings["s"]["c"] = {"<cmd>lua require('telescope.builtin').live_grep({cwd = 'chat'})<CR>", "Grep chat" }
lvim.builtin.which_key.mappings["s"]["u"] = {"<cmd>Telescope resume<CR>", "Last search" }
lvim.builtin.which_key.mappings["s"]["d"] = {"<cmd>lua require('telescope.builtin').diagnostics({default_text = ':error:'})<CR>", "LSP errors" }

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
lvim.builtin.terminal.active = false
lvim.builtin.dap.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.treesitter.rainbow = { enable = true }

local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.sections.lualine_b = { { "filename", path = 1, shorting_target = 100 } }
lvim.builtin.lualine.sections.lualine_d = {}
lvim.builtin.lualine.sections.lualine_x = { components.diagnostics }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "javascript",
    "json",
    "lua",
    "typescript",
    "tsx",
}

lvim.builtin.treesitter.ignore_install = {
    "haskell",
    "java",
    "c",
    "bash",
    "css",
    "yaml"
}
lvim.builtin.treesitter.highlight.enabled = false
lvim.builtin.treesitter.incremental_selection = {
    enable= true,
}
lvim.lsp.installer.setup.automatic_installation = false

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d,
    },
})

lvim.plugins = {
    { "ggandor/leap.nvim",
        config = function() require('leap').set_default_keymaps() end,
    },
    {
        "folke/persistence.nvim", -- save sessions
        event = "VeryLazy",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    { 'tpope/vim-abolish'}, --- smarter substitute and abbreviate
    { 'tpope/vim-fugitive'}, --- git integration
    { 'tpope/vim-repeat'}, --- repeat commands better
    { 'tpope/vim-surround'}, --- surround things better
    { 'tpope/vim-unimpaired'}, --- toggle mappings quicker
    { 'bluz71/vim-nightfly-guicolors'}, -- color scheme
}

local options = {
    autoindent = true,
    autoread = true,
    backspace = { "indent", "start", "eol" },
    cmdheight = 0,
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
vim.api.nvim_create_user_command("ZSH", ":e ~/.zshrc", {})
vim.api.nvim_create_user_command("JSON", ":set ft=json|:%! jq .", {})
