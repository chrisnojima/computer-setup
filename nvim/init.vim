"Plugins===================================
let $BASH_ENV="~/.bash_aliases"
set shell=/bin/bash

lua require('basic')
lua require('plug')
lua require('colors')

"Coc extensions (manual)
"coc-css
"coc-highlight
"coc-html
"coc-json
"coc-prettier
"coc-eslint
"coc-tsserver
":CocConfig
"
"
"{
"    "coc.preferences.formatOnSaveFiletypes": ["javascript", "javascriptreact", "typescript", "typescriptreact", "json"]
"}

" Lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['relativepath', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'cocstatus', 'currentfunction']]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'currentfunction': 'CocCurrentFunction'
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
let g:python3_host_prog = '/usr/local/bin/python3'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set completeopt-=preview

lua require('keys')

" Keybase specific
:cd /Users/chrisnojima/go/src/github.com/keybase/client/shared

" strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

