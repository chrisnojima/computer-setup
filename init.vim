"Plugins===================================
let $BASH_ENV="~/.bash_aliases"
set shell=/bin/bash
call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"Visual
Plug 'airblade/vim-gitgutter' "show git changes in the gutter
Plug 'luochen1990/rainbow' " better rainbow
Plug 'nathanaelkane/vim-indent-guides' "visually shows indents
Plug 'itchyny/lightline.vim' "status bar / tabs
Plug 'roman/golden-ratio' "keep window sizes better

"Movement
Plug 'vim-scripts/matchit.zip', { 'for': 'javascript' } "smarter %
Plug 'justinmk/vim-sneak' " better movement

"Search
Plug 'jremmen/vim-ripgrep' " better search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "fuzzy finder

"Files
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } "file explorer
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }  " git aware nerdtree

"Utility
Plug 'tpope/vim-abolish' "smarter substitute and abbreviate
Plug 'tpope/vim-fugitive' "git integration
Plug 'tpope/vim-repeat' "repeat commands better
Plug 'tpope/vim-surround' "surround things better
Plug 'tpope/vim-unimpaired' "toggle mappings quicker
Plug 'scrooloose/nerdcommenter' "better comments
Plug 'mhartington/oceanic-next' " colors
Plug 'w0rp/ale' "linter
Plug 'sheerun/vim-polyglot' "various language support (js etc)
Plug 'sjl/gundo.vim' "viz undo tree
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " auto complete
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " LSP
Plug 'Raimondi/delimitMate' "closes brackets
call plug#end()

"Settings ===================================
" Only load this once
if !has('nvim')
    set encoding=utf8 "we like utf8
endif

set ai "auto indent
set autoread "auto reload changed files
set backspace=indent,start,eol "better backspace
set clipboard=unnamed "use system clipboard for yank
set cmdheight=2 "set command height
set cursorline "show current lint
set diffopt=vertical "vertical diffs
set expandtab "tabs turn into spaces
set ffs=unix,dos,mac "acceptable file formats
set foldcolumn=1 "how wide the fold column is
set foldlevelstart=99 "start unfolded
set foldmethod=indent "faster than syntax
set hidden "hide buffers
set history=700 "how much history to store
set hlsearch "highlight as you search
set ignorecase "ignore case as you search
set inccommand=split "realtime replace
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
set nu rnu "show line numbers as hybrid relative
set shiftwidth=4 "tab width
set showcmd "show current command on lower right, useful for leader
set showmatch "show matching brackets
set si "smart indent
set smartcase "override ignorecase when you really want case
set smarttab "make tabs correct
set spell "spellcheck
set suffixesadd=.tsx,.d.ts,.js
set t_vb= " no sounds
set tabstop=4 "tabs
set termguicolors "full colors
set tm=500 "no sounds
set tw=0 "never linebreak
set virtualedit=block "visual block anywhere
set wildmenu " visual autocomplete for command menu
set wrap "wrap lines

syntax enable "show syntax
colorscheme OceanicNext
" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['relativepath', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ 'tab_component_function': {
\   'filename': 'MyTabFilename'
\ },
\ }

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction


function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction
" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

"Plugin Settings ===================================
au BufNewfile,BufRead *.json set ft=json5 "json treated as json5
au BufNewfile,BufRead *.less set ft=scss "less files treated like css
au BufNewfile,BufRead *.css set ft=scss "less files treated like css
au BufNewfile,BufRead *.iced set ft=coffee "templates as coffee

au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType go setlocal omnifunc=

au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1b2b34 ctermbg=232
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333 ctermbg=233

highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'typescript.jsx': ['eslint'],
\   'typescript.tsx': ['eslint'],
\   'javascript': ['eslint'],
\   'scss': ['stylelint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'typescript.tsx': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'scss': ['prettier', 'stylelint'],
\}
let g:ale_fix_on_save = 1
let NERDTreeMinimalUI=1 "Hide help text
let NERDTreeShowBookmarks=1 "show bookmarks on start
let g:NERDSpaceDelims=1 "space after comments

let g:go_autodetect_gopath = 0
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1 "show indents on startup
let g:jsx_ext_required = 0 "let jsx helper work on js
let g:rainbow_active = 1
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1
set rtp+=~/.fzf
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
let g:polyglot_disabled = ['graphql']
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 200
let g:deoplete#source#attribute#min_pattern_length = 0
let g:deoplete#file#enable_buffer_path = 1
let g:python3_host_prog = '/usr/local/bin/python3'

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\ 'javascript': ['typescript-language-server', '--stdio'],
\ 'javascript.jsx': ['typescript-language-server', '--stdio'],
\ 'typescript': ['typescript-language-server', '--stdio'],
\ 'typescriptreact': ['typescript-language-server', '--stdio'],
\ 'typescript.jsx': ['typescript-language-server', '--stdio'],
\ 'typescript.tsx': ['typescript-language-server', '--stdio']
\ }
let g:LanguageClient_rootMarkers = ['tsconfig.json']
let g:LanguageClient_selectionUI = 'location-list'
let g:LanguageClient_diagnosticsList = 'Location'
" let g:LanguageClient_loggingFile = expand('~/Desktop/LanguageClient.log')
" let g:LanguageClient_loggingLevel = 'DEBUG'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set completeopt-=preview
" Key maps
:command! Q :qa!
map q: <Nop>
nnoremap Q <nop>
let g:mapleader = "," "comma better than \
let mapleader = "," "comma better than \
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
"very magic
nnoremap / /\v
cnoremap %s/ %s/\v
map <leader>cd :cd %:p:h<CR>
map <leader>n <c-w>w
map <leader>nf :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>o <c-w>o<cr>
map <leader>t :tabc<cr>
map <leader>b :TagbarToggle<cr>
map <leader>w :w<cr>
map <leader>to :tabo<cr>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>q :normal @q<CR>
map <leader>s vi{:sort<CR>
map <leader>sp a<CR><ESC>[{%i,<ESC>v[{:s/,/,\r/g<CR>kv%=jvi{:sort<CR>[{v%J/jkl<CR>
map <leader>c v%J<CR>
map <leader>f :call LanguageClient_textDocument_hover()<CR>
map <leader>g :call LanguageClient_textDocument_definition()<CR>
map <leader>ff :call LanguageClient_contextMenu()<CR>
nmap <c-p> :Files<CR>
nmap <c-l> :Buffers<CR>
inoremap <C-c>  <Esc>
" do match 1+1<C-A> =2!
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
:command! -nargs=1 S Rg -g '*.tsx' -g '*.d.ts' <q-args> ..
nnoremap K <nop>
nnoremap n nzz
nnoremap N Nzz
nnoremap :cn :cn<CR>zz
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3
" move lines up/down in visual using JK from wincent
function! s:Visual()
  return visualmode() == 'V'
endfunction

function! s:Move(address, should_move)
  if s:Visual() && a:should_move
    execute "'<,'>move " . a:address
    " call feedkeys('gv=', 'n') " dont intent as its too slow
  endif
  call feedkeys('gv', 'n')
endfunction

function! Move_up() abort range
  let l:count=v:count ? -v:count : -1
  let l:max=(a:firstline - 1) * -1
  let l:movement=max([l:count, l:max])
  let l:address="'<" . (l:movement - 1)
  let l:should_move=l:movement < 0
  call s:Move(l:address, l:should_move)
endfunction

function! Move_down() abort range
  let l:count=v:count ? v:count : 1
  let l:max=line('$') - a:lastline
  let l:movement=min([l:count, l:max])
  let l:address="'>+" . l:movement
  let l:should_move=l:movement > 0
  call s:Move(l:address, l:should_move)
endfunction

xnoremap <silent> K :call Move_up()<CR>
xnoremap <silent> J :call Move_down()<CR>

" Keybase specific
:cd /Users/chrisnojima/go/src/github.com/keybase/client/shared
