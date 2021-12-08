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
  use {'scrooloose/nerdtree', on = {'NERDTreeToggle', 'NERDTreeFind'}} --- file explorer
  use {'Xuyuanp/nerdtree-git-plugin', on = {'NERDTreeToggle', 'NERDTreeFind'}}  ---  git aware nerdtree

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

  --- Utility
  use 'tpope/vim-abolish' --- smarter substitute and abbreviate
  use 'tpope/vim-fugitive' --- git integration
  use 'tpope/vim-repeat' --- repeat commands better
  use 'tpope/vim-surround' --- surround things better
  use 'tpope/vim-unimpaired' --- toggle mappings quicker
  use 'scrooloose/nerdcommenter' --- better comments
  use 'mhartington/oceanic-next' ---  colors
  -- use 'sheerun/vim-polyglot' --- various language support (js etc)
  -- use 'sjl/gundo.vim' --- viz undo tree
  use {'neoclide/coc.nvim', branch = 'release'}
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
