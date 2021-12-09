require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nathom/filetype.nvim' --- faster startup
  use 'nvim-lua/plenary.nvim' --- used by deps
  use 'kyazdani42/nvim-web-devicons' -- nice icons

  use 'airblade/vim-gitgutter' --- show git changes in the gutter
  use 'luochen1990/rainbow' ---  better rainbow
  use 'nathanaelkane/vim-indent-guides' --- visually shows indents
  use 'itchyny/lightline.vim' --- status bar / tabs
  -- use 'roman/golden-ratio' --- keep window sizes better
  -- use 'justinmk/vim-sneak' ---  better movement
  -- use {'vim-scripts/matchit.zip', ['for'] = 'javascript'} --- smarter %

  --- Search
  -- use 'jremmen/vim-ripgrep' ---  better search
  -- use {'junegunn/fzf', dir= '~/.fzf', ['do']= './install --all'}
  -- use 'junegunn/fzf.vim' --- fuzzy finder

  --- Files
  -- use {'scrooloose/nerdtree', on = {'NERDTreeToggle', 'NERDTreeFind'}} --- file explorer
  -- use {'Xuyuanp/nerdtree-git-plugin', on = {'NERDTreeToggle', 'NERDTreeFind'}}  ---  git aware nerdtree

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
      config = "require('plugins.treesitter')",
      run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}
  use {'RRethy/nvim-treesitter-textsubjects', after = {'nvim-treesitter'}}

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim'}
      }
    }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP
  use {'neovim/nvim-lspconfig'}
use {'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
-- use {'hrsh7th/nvim-cmp', config = "require('plugins.cmp')"}
use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua'}
use {'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp'}
use {'hrsh7th/cmp-path', after = 'cmp-buffer'}
use {'hrsh7th/cmp-calc', after = 'cmp-path'}
use {'tami5/lspsaga.nvim', config = "require('plugins.saga')"}
use {'onsails/lspkind-nvim'}
use {'folke/lsp-trouble.nvim', config = "require('plugins.trouble')"}
use {'SmiteshP/nvim-gps', config = "require('plugins.gps')", after = 'nvim-treesitter'}
use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}
use {'williamboman/nvim-lsp-installer', after = 'cmp-nvim-lsp', config = "require('lsp.installer')"}

  --- Utility
  use {'numToStr/Comment.nvim', config = "require('plugins.comment')"}
use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'}
use {'folke/todo-comments.nvim'}
use {'ggandor/lightspeed.nvim'}
use {'glepnir/galaxyline.nvim', after = 'nvim-gps', config = "require('plugins.galaxyline')"}
use {'romgrk/barbar.nvim', config = "require('plugins.barbar')"}
use {'rcarriga/nvim-notify'}
use {'windwp/nvim-autopairs', after = {'nvim-treesitter', 'nvim-cmp'}, config = "require('plugins.autopairs')"}
use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
use {'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')"}
use {'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')"}
use {'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')"}
use {'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = "require('plugins.gitsigns')",
  event = "BufRead"
}
  use 'tpope/vim-abolish' --- smarter substitute and abbreviate
  use 'tpope/vim-fugitive' --- git integration
  use 'tpope/vim-repeat' --- repeat commands better
  use 'tpope/vim-surround' --- surround things better
  use 'tpope/vim-unimpaired' --- toggle mappings quicker
  -- use 'scrooloose/nerdcommenter' --- better comments
  use 'mhartington/oceanic-next' ---  colors
  -- use 'sheerun/vim-polyglot' --- various language support (js etc)
  -- use 'sjl/gundo.vim' --- viz undo tree
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- use 'Raimondi/delimitMate' --- closes brackets

end)

vim.cmd 'source ~/.config/nvim/lua/plug-todo.vim'

--- Coc extensions (manual)
--- coc-css
--- coc-highlight
--- coc-html
--- coc-json
--- coc-prettier
--- coc-eslint
--- coc-tsserver
--- :CocConfig
---
---
--- {
---     "coc.preferences.formatOnSaveFiletypes": ["javascript", "javascriptreact", "typescript", "typescriptreact", "json"]
--- }
---
