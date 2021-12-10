vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.python_host_prog = "/usr/local/bin/python2"

vim.g.guifont="Fira_Code_Regular_Nerd_Font_Complete:h14"

vim.opt.ai = true
vim.opt.autoread = true
vim.opt.backspace = {"indent","start","eol"} --- better backspace
vim.opt.clipboard = "unnamed,unnamedplus" --- use system clipboard for yank
vim.opt.cmdheight = 2 --- set command height
vim.opt.cursorline = true --- show current lint
vim.opt.diffopt = "vertical" --- vertical diffs
vim.opt.expandtab = true --- tabs turn into spaces
vim.opt.emoji = false --- fix emoji display
vim.opt.ffs = {"unix","dos","mac"} --- acceptable file formats
vim.opt.foldcolumn = "0" --- how wide the fold column is
vim.opt.foldlevelstart = 99 --- start unfolded
vim.opt.foldmethod = "indent" --- faster than syntax
vim.opt.hidden = true --- hide buffers
vim.opt.history = 700 --- how much history to store
vim.opt.hlsearch = true --- highlight as you search
vim.opt.ignorecase = true --- ignore case as you search
vim.opt.inccommand = "split" --- realtime replace
vim.opt.incsearch = true --- incremental search
vim.opt.laststatus = 2 --- always show the statusbar
vim.opt.lazyredraw = true --- buffers screen updates
vim.opt.lbr = true --- linebreak
vim.opt.magic = true --- magic regexp options
vim.opt.mat = 2 --- blink speed
vim.opt.backup = false --- no backup files
vim.opt.errorbells = false --- no sounds
vim.opt.swapfile = false --- no backup files
vim.opt.visualbell = false --- no sounds
vim.opt.wb = false --- no backup files
vim.opt.rnu = true --- show line numbers as hybrid relative
vim.opt.shiftwidth = 4 --- tab width
vim.opt.showcmd = true --- show current command on lower right, useful for leader
vim.opt.showmatch = true --- show matching brackets
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.signcolumn = "yes"
vim.opt.si = true --- smart indent
vim.opt.smartcase = true --- override ignorecase when you really want case
vim.opt.smarttab = true --- make tabs correct
vim.opt.spell = true --- spellcheck
vim.opt.suffixesadd = {".tsx", ".d.ts", ".js"}
vim.opt.tabstop = 4 --- tabs
vim.opt.termguicolors  = true --- full colors
vim.opt.timeoutlen = 300 -- faster complete
vim.opt.tm = 500 --- no sounds
vim.opt.tw = 0 --- never linebreak
vim.opt.updatetime = 100 --- faster refresh
vim.opt.virtualedit = "block" --- visual block anywhere
vim.opt.wildmenu  = true ---  visual autocomplete for command menu
vim.opt.wildignore = "*node_modules/**" -- ignore
vim.opt.wrap  = true --- wrap lines
vim.opt.encoding = "utf8"
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
