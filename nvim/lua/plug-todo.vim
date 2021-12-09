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

" Lightline
" function! CocCurrentFunction()
    " return get(b:, 'coc_current_function', '')
" endfunction

" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ 'active': {
" \   'left': [['mode', 'paste'], ['relativepath', 'modified']],
" \   'right': [['lineinfo'], ['percent'], ['readonly', 'cocstatus', 'currentfunction']]
" \ },
" \ 'component_function': {
" \   'cocstatus': 'coc#status',
" \   'currentfunction': 'CocCurrentFunction'
" \ },
" \ 'component_expand': {
" \   'linter_warnings': 'LightlineLinterWarnings',
" \   'linter_errors': 'LightlineLinterErrors',
" \   'linter_ok': 'LightlineLinterOK'
" \ },
" \ 'component_type': {
" \   'readonly': 'error',
" \   'linter_warnings': 'warning',
" \   'linter_errors': 'error'
" \ },
" \ 'tab_component_function': {
" \   'filename': 'MyTabFilename'
" \ },
" \ }

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

"
"
  " coc
  "
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" set completeopt-=preview

  " " Use tab for trigger completion with characters ahead and navigate.
  " " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  " inoremap <silent><expr> <TAB>
        " \ pumvisible() ? "\<C-n>" :
        " \ <SID>check_back_space() ? "\<TAB>" :
        " \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " function! s:check_back_space() abort
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~# '\s'
  " endfunction

  " " Use <c-space> to trigger completion.
  " inoremap <silent><expr> <c-space> coc#refresh()

  " " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " " Coc only does snippet and additional edit on confirm.
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " " Or use `complete_info` if your vim support it, like:
  " " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " " Use `[g` and `]g` to navigate diagnostics
  " nmap <silent> [g <Plug>(coc-diagnostic-prev)
  " nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " " Remap keys for gotos
  " nmap <silent> gd <Plug>(coc-definition)
  " nmap <silent> gy <Plug>(coc-type-definition)
  " nmap <silent> gi <Plug>(coc-implementation)
  " nmap <silent> gr <Plug>(coc-references)

  " " Use K to show documentation in preview window
  " nnoremap <silent> K :call <SID>show_documentation()<CR>

  " function! s:show_documentation()
    " if (index(['vim','help'], &filetype) >= 0)
      " execute 'h '.expand('<cword>')
    " else
      " call CocAction('doHover')
    " endif
  " endfunction

  " " Highlight symbol under cursor on CursorHold
  " autocmd CursorHold * silent call CocActionAsync('highlight')

  " " Remap for rename current word
  " nmap <leader>rn <Plug>(coc-rename)

  " " Remap for format selected region
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  " augroup mygroup
    " autocmd!
    " " Setup formatexpr specified filetype(s).
    " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " " Update signature help on jump placeholder
    " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " augroup end

  " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " " Remap for do codeAction of current line
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " " Fix autofix problem of current line
  " nmap <leader>qf  <Plug>(coc-fix-current)

  " " Create mappings for function text object, requires document symbols feature of languageserver.
  " xmap if <Plug>(coc-funcobj-i)
  " xmap af <Plug>(coc-funcobj-a)
  " omap if <Plug>(coc-funcobj-i)
  " omap af <Plug>(coc-funcobj-a)

  " " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  " nmap <silent> <C-d> <Plug>(coc-range-select)
  " xmap <silent> <C-d> <Plug>(coc-range-select)

  " " Use `:Format` to format current buffer
  " command! -nargs=0 Format :call CocAction('format')

  " " Use `:Fold` to fold current buffer
  " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " " use `:OR` for organize import of current buffer
  " command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " " Add status line support, for integration with other plugin, checkout `:h coc-status`
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " " Using CocList
  " " Show all diagnostics
  " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " " Manage extensions
  " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " " Show commands
  " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " " Find symbol of current document
  " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " " Search workspace symbols
  " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " " Do default action for next item.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " " Do default action for previous item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " " Resume latest coc list
  " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




" strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
