set nocompatible "needed by vundle
filetype off "needed by vundle

"Plugins===================================

if has("mac") || has("macunix")
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif
if has("win32")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "plugin manager
Plugin 'matchit.zip' "smarter %
Plugin 'scrooloose/nerdtree.git' "file explorer
Plugin 'kien/rainbow_parentheses.vim.git' "color parentheses
Plugin 'scrooloose/syntastic.git' "better syntax highlighting 
Plugin 'Lokaltog/vim-easymotion.git' "move anywhere visually
Plugin 'maksimr/vim-jsbeautify.git' "format js
Plugin 'tpope/vim-repeat.git' "repeat commands better
Plugin 'tpope/vim-surround.git' "surround things better
Plugin 'tpope/vim-unimpaired.git' "toggle mappings quicker
Plugin 'tpope/vim-fugitive.git' "git integration
Plugin 'airblade/vim-gitgutter.git' "show git changes in the gutter
Plugin 'Raimondi/delimitMate.git' "injects closing quotes/brackets
Plugin 'kien/ctrlp.vim.git' "smart search
Plugin 'myusuf3/numbers.vim' "show line numbers as offsets
Plugin 'bling/vim-airline.git' "cool statusbar
Plugin 'MarcWeber/vim-addon-mw-utils' "pre-req for snipmate
Plugin 'tomtom/tlib_vim' "pre-req for snipmate
Plugin 'garbas/vim-snipmate' "snippet engine
Plugin 'honza/vim-snippets' "common snippets
Plugin 'chrisnojima/nojima-vim-snippets.git' "my snippets
Plugin 'moll/vim-node.git' "helpers for node, jump through requires
Plugin 'mileszs/ack.vim.git' "better search than grep
Plugin 'nathanaelkane/vim-indent-guides.git' "visually shows indents
Plugin 'tomasr/molokai.git' "simple colorscheme
call vundle#end()           
filetype plugin indent on "needed by vundle

"Settings ===================================
set ai "auto indent
set clipboard=unnamed "use system clipboard for yank
set cmdheight=2 "set command height
set encoding=utf8 "we like utf8
set expandtab "tabs turn into spaces
set ffs=unix,dos,mac "acceptable file formats
set foldcolumn=1 "how wide the fold column is
set history=700 "how much history to store
set hlsearch "highlight as you search
set ignorecase "ignore case as you search
set incsearch "incremental search
set laststatus=2 "always show the statusbar
set lazyredraw "buffers screen updates
set lbr "linebreak
set magic "magic regexp options
set mat=2 "blink speed
set nobackup "no backup files
set noerrorbells "no sounds
set noswapfile "no backup files
set novisualbell "no sounds
set nowb "no backup files
set nu "show line numbers
set shiftwidth=2 "tab width
set showcmd "show current command on lower right, useful for leader
set showmatch "show matching brackets
set si "smart indent
set smartcase "override ignorecase when you really want case
set smarttab "make tabs correct
set spell "spellcheck
set t_vb= " no sounds
set tabstop=2 "tabs
set tm=500 "no sounds
set tw=500 "linebreak at 500 chars
set wrap "wrap lines
syntax enable "show syntax

"Style Settings ===================================
colorscheme molokai
set guifont=Anonymous\ Pro\ for\ Powerline:h16

"Plugin Settings ===================================
let NERDTreeMinimalUI=1 "Hide help text
let NERDTreeShowBookmarks=1 "show bookmarks on start
let g:syntastic_check_on_open=1 "auto load syntastic
let g:syntastic_enable_highlighting=1 "highlight syntax errors
au BufNewfile,BufRead *.less set ft=less.css "less files treated like css
au VimEnter * RainbowParenthesesToggle "auto load rainbow
au Syntax * RainbowParenthesesLoadRound "show rainbow on (
au Syntax * RainbowParenthesesLoadSquare "show rainbow on [
au Syntax * RainbowParenthesesLoadBraces "show rainbow on {
let g:ctrlp_map = '<c-p>' "control-p mapping
let g:ctrlp_cmd = 'CtrlP' "control-p command
let g:ctrlp_working_path_mode = 'ra' "start ctrp back to the root of our repo
let g:airline#extensions#tabline#enabled = 1 "extensions in airline
let g:airline_powerline_fonts = 1 "good fonts in airline
let g:indent_guides_enable_on_vim_startup = 1 "show indents on startup

" Key maps
let mapleader = "," "comma better than \
let g:mapleader = "," "comma better than \

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>w :w<cr>
map <leader>cd :cd %:p:h<CR>
map <leader>o <c-w>o<cr>
map <leader>t :silent !open -a /Applications/iTerm.app/ .<CR>

