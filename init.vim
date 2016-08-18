"Plugins===================================
set shell=/bin/sh
call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Lokaltog/vim-easymotion' "move anywhere visually
Plug 'MarcWeber/vim-addon-mw-utils' "pre-req for snipmate
Plug 'Raimondi/delimitMate' "injects closing quotes/brackets
Plug 'airblade/vim-gitgutter' "show git changes in the gutter
Plug 'ap/vim-css-color' "color css
Plug 'bling/vim-airline' "cool statusbar
Plug 'chrisbra/csv.vim' "csv plugin
Plug 'chrisnojima/nojima-vim-snippets' "my snippets
Plug 'ctrlpvim/ctrlp.vim' "smart search (fork)
Plug 'editorconfig/editorconfig-vim' "editorconfig
Plug 'fatih/vim-go' "go niceties
Plug 'gregsexton/gitv' "better git history
Plug 'honza/vim-snippets' "common snippets
Plug 'kien/rainbow_parentheses.vim' "color parentheses
Plug 'majutsushi/tagbar' "show tags
Plug 'maksimr/vim-jsbeautify' "format js
Plug 'matchit.zip' "smarter %
Plug 'mileszs/ack.vim' "better search than grep
Plug 'moll/vim-node' "helpers for node, jump through requires
Plug 'myusuf3/numbers.vim' "show line numbers as offsets
Plug 'nathanaelkane/vim-indent-guides' "visually shows indents
Plug 'ntpeters/vim-better-whitespace' "show trailing whitespace
Plug 'pangloss/vim-javascript' "better js support
Plug 'rking/ag.vim' "the silver searcher
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } "file explorer
Plug 'neomake/neomake' " linter async
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tomasr/molokai' "simple colorscheme
Plug 'sjl/badwolf' " color
Plug 'tpope/vim-abolish' "smarter substitute and abbreviate
Plug 'tpope/vim-fugitive' "git integration
Plug 'tpope/vim-repeat' "repeat commands better
Plug 'tpope/vim-surround' "surround things better
Plug 'tpope/vim-unimpaired' "toggle mappings quicker
Plug 'Xuyuanp/nerdtree-git-plugin' " git aware nerdtree
Plug 'wellle/targets.vim' "better text objects
Plug 'mxw/vim-jsx' "jsx helpers
Plug 'scrooloose/nerdcommenter' "better comments
Plug 'justinmk/vim-sneak' " better movement
call plug#end()

"Settings ===================================
set ai "auto indent
set autoread "auto reload changed files
set clipboard=unnamed "use system clipboard for yank
set cmdheight=2 "set command height
set diffopt=vertical "vertical diffs
set encoding=utf8 "we like utf8
set expandtab "tabs turn into spaces
set ffs=unix,dos,mac "acceptable file formats
set foldcolumn=1 "how wide the fold column is
set guifont=Anonymous\ Pro\ for\ Powerline:h16
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
set shiftwidth=4 "tab width
set showcmd "show current command on lower right, useful for leader
set showmatch "show matching brackets
set si "smart indent
set smartcase "override ignorecase when you really want case
set smarttab "make tabs correct
set spell "spellcheck
set t_vb= " no sounds
set tabstop=4 "tabs
set termguicolors
set tm=500 "no sounds
set tw=0 "never linebreak
set wildmenu " visual autocomplete for command menu
set wrap "wrap lines

syntax enable "show syntax
colorscheme badwolf

"Plugin Settings ===================================
au BufNewfile,BufRead *.less set ft=scss "less files treated like css
au BufNewfile,BufRead *.css set ft=scss "less files treated like css
au BufNewfile,BufRead *.iced set ft=coffee "templates as coffee
au BufNewfile,BufRead *.flow set ft=javascript | :let b:syntastic_checkers = ["flow"]
au Syntax * RainbowParenthesesLoadBraces "show rainbow on {
au Syntax * RainbowParenthesesLoadRound "show rainbow on (
au Syntax * RainbowParenthesesLoadSquare "show rainbow on [
au VimEnter * RainbowParenthesesToggle "auto load rainbow
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222222 ctermbg=232
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333 ctermbg=233

let NERDTreeMinimalUI=1 "Hide help text
let NERDTreeShowBookmarks=1 "show bookmarks on start
let g:ack_autofold_results = 1
let g:ackhighlight = 1
let g:ackprg = 'ag --nogroup --column --max-count=3 --silent --vimgrep '
let g:airline#extensions#tabline#enabled = 1 "extensions in airline
let g:airline_powerline_fonts = 1 "good fonts in airline
let g:ctrlp_cmd = 'CtrlPMixed' "control-p command
let g:ctrlp_lazy_update = 0 "update after you stop typing
let g:ctrlp_map = '<c-p>' "control-p mapping
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_match_window = 'max:20,results:20'
let g:ctrlp_max_files = 0 "unlimited files
let g:ctrlp_regexp = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_use_caching = 0 " super fast with ag
let g:ctrlp_user_command = {
    \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ -g ""'
    \ }
let g:ctrlp_working_path_mode = 'ra' "start ctrp back to the root of our repo
let g:go_autodetect_gopath = 0
let g:indent_guides_enable_on_vim_startup = 1 "show indents on startup
let g:jsx_ext_required = 0 "let jsx helper work on js
let g:syntastic_aggregate_errors = 1 "don't show all errors, too slow
let g:syntastic_always_populate_loc_list = 1 "so you can jump with ]l
let g:syntastic_check_on_open=1 "auto load syntastic
let g:syntastic_enable_highlighting = 1 "more showy
let g:syntastic_error_symbol = '' "fancy
let g:neomake_go_maker = ['golint', 'gofmt', 'govet']
let g:syntastic_go_checkers = ['golint', 'gofmt', 'govet']
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_style_error_symbol = '' "fancy
let g:syntastic_style_warning_symbol = '' "fancy
let g:syntastic_warning_symbol = '' "fancy
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:NERDSpaceDelims=1 "space after comments
let g:rainbow_active = 1
let g:indent_guides_auto_colors = 0

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" if findfile('.flowconfig', '.;') !=# ''
  let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
  if g:flow_path != 'flow not found'
    let g:neomake_javascript_flow_maker = {
          \ 'exe': 'sh',
          \ 'args': ['-c', g:flow_path.' --json 2>/dev/null| flow-vim-quickfix'],
          \ 'errorformat': '%E%f:%l:%c\,%n: %m',
          \ 'cwd': '%:p:h'
          \ }
    let g:neomake_javascript_enabled_makers = ['flow'] + g:neomake_javascript_enabled_makers
    let g:neomake_jsx_enabled_makers = ['flow'] + g:neomake_jsx_enabled_makers
  endif
" endif

" This is kinda useful to prevent Neomake from unnecessary runs
if !empty(g:neomake_javascript_enabled_makers)
  autocmd! BufWritePost * Neomake
endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 3
" Enable omni completion.
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'
" Point to python3 (needed by deoplete)
let g:python3_host_prog = '/usr/local/bin/python3'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set completeopt-=preview
" Key maps
:command! Q :q
let g:mapleader = "," "comma better than \
let mapleader = "," "comma better than \
map <leader>cd :cd %:p:h<CR>
map <leader>n <c-w>w
map <leader>nf :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>o <c-w>o<cr>
map <leader>t :CtrlPTag<cr>
map <leader>b :TagbarToggle<cr>
map <leader>w :w<cr>
map <leader>jl :%!jsonlint -p<cr>
map <leader>js :set ft=javascript<cr>
map <leader>to :tabo<cr>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>q :normal @q<CR>

:command! -nargs=1 Search Ack --js <q-args> ..

:nnoremap n nzz
:nnoremap N Nzz

" Keybase specific
" :cd /Users/chrisnojima/go/src/github.com/keybase/client/react-native/react
" :cd /Users/chrisnojima/go/src/github.com/keybase/client/shared
:cd /Users/chrisnojima/go/src/github.com/keybase/client/desktop

map <leader>go :Dispatch fish -c "gobuild"<CR>
map <leader>ios :Dispatch fish -c "goBuildIos"<CR>

let g:syntastic_ignore_files = ['\m^/Users/chrisnojima/go/src/github.com/keybase/client/desktop/dist', '\m\c\.h$']
let g:syntastic_go_golint_quiet_messages = {
    \ "regex": '\(should have comment\|possible formatting\|comment on exported \)'
    \}

let g:syntastic_js_flow_quiet_messages = {
    \ "regex": '\(Required Module Not Found\)'
    \}
