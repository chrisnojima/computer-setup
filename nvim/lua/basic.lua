vim.opt.ai = true
vim.opt.autoread = true
--- better backspace
vim.opt.backspace = {"indent","start","eol"}
--- use system clipboard for yank
vim.opt.clipboard = "unnamed"
--- set command height
vim.opt.cmdheight = 2
--- show current lint
vim.opt.cursorline = true
--- vertical diffs
vim.opt.diffopt = "vertical"
--- tabs turn into spaces
vim.opt.expandtab = true
--- acceptable file formats
vim.opt.ffs = {"unix","dos","mac"}
--- how wide the fold column is
vim.opt.foldcolumn = "0"
--- start unfolded
vim.opt.foldlevelstart = 99
--- faster than syntax
vim.opt.foldmethod = "indent"
--- hide buffers
vim.opt.hidden = true
--- how much history to store
vim.opt.history = 700
--- highlight as you search
vim.opt.hlsearch = true
--- ignore case as you search
vim.opt.ignorecase = true
--- realtime replace
vim.opt.inccommand = "split"
--- incremental search
vim.opt.incsearch = true
--- always show the statusbar
vim.opt.laststatus = 2
--- buffers screen updates
vim.opt.lazyredraw = true
--- linebreak
vim.opt.lbr = true
--- magic regexp options
vim.opt.magic = true
--- blink speed
vim.opt.mat = 2
--- no backup files
vim.opt.backup = false
--- no sounds
vim.opt.errorbells = false
--- no backup files
vim.opt.swapfile = false
--- no sounds
vim.opt.visualbell = false
--- no backup files
vim.opt.wb = false
--- show line numbers as hybrid relative
vim.opt.rnu = true
--- tab width
vim.opt.shiftwidth = 4
--- show current command on lower right, useful for leader
vim.opt.showcmd = true
--- show matching brackets
vim.opt.showmatch = true
--- from coc
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.signcolumn = "yes"
--- smart indent
vim.opt.si = true
--- override ignorecase when you really want case
vim.opt.smartcase = true
--- make tabs correct
vim.opt.smarttab = true
--- spellcheck
vim.opt.spell = true
vim.opt.suffixesadd = {".tsx", ".d.ts", ".js"}
--- tabs
vim.opt.tabstop = 4
--- full colors
vim.opt.termguicolors  = true
--- no sounds
vim.opt.tm = 500
--- never linebreak
vim.opt.tw = 0
--- faster refresh
vim.opt.updatetime = 300
--- visual block anywhere
vim.opt.virtualedit = "block"
---  visual autocomplete for command menu
vim.opt.wildmenu  = true
--- wrap lines
vim.opt.wrap  = true
