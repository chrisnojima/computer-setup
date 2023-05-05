vim.opt.shell                             = "/bin/sh"
-- lvim.log.level = "debug"
lvim.log.level                            = "warn"
lvim.format_on_save                       = {
    enabled = true,
    pattern = "*",
    timeout = 10000,
}
lvim.colorscheme                          = "nightfly"

vim.g.nightflyCursorColor                 = 1
vim.g.nightflyUnderlineMatchParen         = 0
vim.g.nightflyNormalFloat                 = 1

lvim.leader                               = ","
vim.g.mapleader                           = ','
-- resize windows
lvim.keys.normal_mode["<C-Up>"]           = ":resize +2<CR>"
lvim.keys.normal_mode["<C-Down>"]         = ":resize -2<CR>"
-- legacy keys
lvim.keys.normal_mode["<C-p>"]            = "<cmd>Telescope find_files<CR>"
-- center on search
lvim.keys.normal_mode["n"]                = "nzz"
lvim.keys.normal_mode["N"]                = "Nzz"
lvim.keys.normal_mode[":cn"]              = ":cn<CR>zz"

-- keep old buffer changes
lvim.keys.normal_mode["<S-h>"]            = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<S-l>"]            = "<cmd>BufferLineCycleNext<cr>"

-- paste on top don't lose clipboard
lvim.keys.visual_mode["p"]                = '"_dP'
lvim.keys.visual_mode["P"]                = '"_dP'

lvim.builtin.which_key.mappings["o"]      = { "<cmd>only<CR>", "Close other panes" }
lvim.builtin.which_key.mappings["nn"]     = { "<cmd>lua require'nvim-tree'.toggle()<CR>", "Open tree" }

lvim.builtin.which_key.mappings["s"]["c"] = { "<cmd>lua require('telescope.builtin').live_grep({cwd = 'chat'})<CR>",
    "Grep chat" }
lvim.builtin.which_key.mappings["s"]["u"] = { "<cmd>Telescope resume<CR>", "Last search" }
lvim.builtin.which_key.mappings["s"]["d"] = {
    "<cmd>lua require('telescope.builtin').diagnostics({default_text = ':error:'})<CR>",
    "LSP errors" }

lvim.builtin.which_key.mappings["S"]      = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["t"]      = {
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

lvim.builtin.lualine.active = true
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.sections = {
    lualine_a = {
        { "fancy_mode", width = 1 }
    },
    lualine_b = {
        { "branch" },
        { "fancy_diff" },
    },
    lualine_c = { { "filename", path = 1, shorting_target = 100 } },
    lualine_d = {},
    lualine_x = {
        { "fancy_macro" },
        { "fancy_diagnostics" },
        { "location" },
    },
    lualine_y = {},
    lualine_z = { "progress" },
}


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
    enable = true,
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
    {
        "ggandor/leap.nvim",
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
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    { 'tpope/vim-abolish' },             --- smarter substitute and abbreviate
    { 'tpope/vim-fugitive' },            --- git integration
    { 'tpope/vim-repeat' },              --- repeat commands better
    { 'tpope/vim-surround' },            --- surround things better
    { 'tpope/vim-unimpaired' },          --- toggle mappings quicker
    { 'bluz71/vim-nightfly-guicolors' }, -- color scheme
    {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
                    suggestion = { enabled = false, auto_trigger = true },
                    panel = { enabled = false, auto_refresh = true },
                }
            end, 100)
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
        after = { "copilot.lua", "nvim-cmp" },
    },
    { "meuter/lualine-so-fancy.nvim" },
}

local options = {
    cmdheight = 1,
    errorbells = false,
    history = 700,
    inccommand = "split",            -- realtime replace
    relativenumber = true,           -- set relative numbered lines
    shiftwidth = 4,                  -- tab width
    spell = true,                    -- spellcheck
    suffixesadd = { ".tsx", ".native.tsx", ".d.ts", ".js" },
    tabstop = 4,                     -- tabs
    termguicolors = true,            -- full colors
    timeoutlen = 500,                -- defer which key some
    virtualedit = "block",           -- visual block anywhere
    wildignore = "*node_modules/**", -- ignore
}
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.diffopt:append('vertical')

vim.cmd(":cd /Users/chrisnojima/go/src/github.com/keybase/client/shared")
vim.api.nvim_create_user_command("Kdebug", ":e ~/Library/Logs/Keybase.app.debug ", {})
vim.api.nvim_create_user_command("ZSH", ":e ~/.zshrc", {})
vim.api.nvim_create_user_command("JSON", ":set ft=json|:%! jq .", {})
