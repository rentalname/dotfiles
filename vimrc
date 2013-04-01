"set vim nocompatible
set nocompatible
"set fileformat
set fileformats=mac,unix,dos
"Set colorscheme
"{{{
if !has("gui_running")
  set t_Co=256
endif
set background=dark
colorscheme peaksea
"}}}
"set transparency
if has('kaoriya')
  set transparency=20
endif
"User Setting Sequence
"{{{
set nobackup
set noswapfile
set number
set clipboard+=unnamed
set wrap
set textwidth=118
set whichwrap=b,s,h,l,<,>,[,]
set statusline+=[%F]
set statusline+=[%Y]
set statusline+=[%{&fileencoding}]
set splitbelow
set splitright
set scrolloff=5
"インデント設定
set autoindent
"タブ幅の設定
set tabstop=4
set shiftwidth=2
set expandtab
set softtabstop=0
"制御コードを表示する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 全角スペースを表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
au BufRead,BufNew * match ZenkakuSpace /　/
" change map leader character
if has('gui_macvim')
  let mapleader = "_"
endif
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" カラースキームを設定する
let scheme = 'peaksea'
augroup gui_colors_cheme
  autocmd!
  execute 'autocmd GUIEnter * colorscheme' scheme
  set background=dark
augroup END
execute 'colorscheme' scheme
"}}}

augroup RubyOnRails
  au!
  au FileType ruby :set nowrap tabstop=2 tw=0 sw=2
  au FileType eruby :set nowrap tabstop=2 tw=2 sw=2
  au BufNewFile *.html.erb set filetype=eruby fenc=euc-jp
  au BufNewFile *.rb set ft=ruby fenc=euc-jp
  au BufNewFile,BufRead *.erb set ft=eruby.html fenc=utf-8
  au BufNewFile,BufRead *./app/*/*.¥.rb set ft=ruby.rails fenc=utf-8
augroup END

if !has('gui_running')
  autocmd RubyOnRails
endif

" User Key Mapping
"{{{
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
inoremap <C-UP> <C-w>h
nnoremap <C-UP> <C-w>h
inoremap <C-DOWN> <C-w>l
nnoremap <C-DOWN> <C-w>l
nmap <Esc><Esc> :nohlsearch<CR>
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
"Load .gvimrc afterv.vimrc edited at GVim.
" Set augroup.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
" ---  ファイラーを起動 ---
nnoremap <silent><Space>j    :Explore<CR>
" 前のバッファ、次のバッファ、バッファの削除、バッファのリスト
nnoremap <silent><Space>b    :bp<CR>
nnoremap <silent><Space>n    :bn<CR>
nnoremap <silent><Space>k    :bd<CR>
nnoremap <Space>o    <C-W>o               " カーソルのあるウインドウを最大化する
nnoremap <silent><Space>h    :hide<CR>    " カーソルのあるウインドウを隠す
nnoremap <silent><Space>l    :ls<CR>
" ファイル保存：バッファ変更時のみ保存
nnoremap <silent><Space>s    :<C-u>update<CR>
"}}}

"NeoBundle
"{{{
set nocompatible               " Be iMproved
filetype off                   " Required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/vimproc', {
  \'build':{
    \'unix':'make -f make_unix.mak',
    \'mac':'make -f make_mac.mak',
  \},
\}
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/neocomplecache-rsense'
" Recommended to install
" After install, turn shell $VIM/vimfiles/bundle/vimproc, (n,g)make -f your_machines_makefile
"My Bundles here:
" Original repos on github
"NeoBundle 'taichouchou2/surround.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'honza/snipmate-snippets'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'taichouchou2/alpaca_complete', {
      \ 'depends' : [ 'tpope/vim-rails', 'Shougo/neocomplcache'],
      \ 'build' : {
      \     'mac' : 'gem install alpaca_complete',
      \     'unix' : 'gem install alpaca_complete',
      \}}
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
" Non github repos
NeoBundle 'git://git.wincent.com/command-t.git'
" Non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
" gist repos
"'git://gist.github.com/187578.git', {'directory': 'h2u_white'}

filetype plugin indent on     " Required!
" Installation check.
NeoBundleCheck
"}}}

"NeoComplecache
"{{{
"set able AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 2
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Rails filetype setting
autocmd BufEnter * if exists("b:rails_root") | NeoComplCacheSetFileType ruby.rails | endif
autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | NeoComplCacheSetFileType ruby.rspec | endif
" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_ke_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}

"NeoSnipet
"{{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
"}}}

"NERDTree
"{{{
autocmd VimEnter * NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" バッファ切り替え
nmap [space]n :<C-U>bnext<CR>
nmap [space]p :<C-U>bprevious<CR>
nnoremap <Leader>1   :e #1<CR>
nnoremap <Leader>2   :e #2<CR>
nnoremap <Leader>3   :e #3<CR>
nnoremap <Leader>4   :e #4<CR>
nnoremap <Leader>5   :e #5<CR>
nnoremap <Leader>6   :e #6<CR>
nnoremap <Leader>7   :e #7<CR>
nnoremap <Leader>8   :e #8<CR>
nnoremap <Leader>9   :e #9<CR>
" バッファ一覧
nmap ,b :buffers<CR>
" 表示/非表示を切替
nmap nt :NERDTreeToggle<CR>
" リフレッシュ
nmap <F5> :NERDTree<CR>
"}}}

"quickrun
"{{{
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
  \ 'type': 'markdown/pandoc',
  \ 'outputter': 'browser',
  \ 'cmdopt': '-s'
\}
"}}}

"vimshell
"{{{
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>
"}}}

"unite-outline
"{{{
nnoremap <silent> <Leader>o :<C-u>Unite -vertical -no-quit outline<CR>
"}}}
"

"vim-browsereload-mac
"{{{
let g:returnApp = "MacVim"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>bo :OperaReloadStart<CR>
nmap <Space>bO :OperaReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>
"}}}

"zen-coding
"{{{
let g:user_zen_settings={
  \'lang' : 'ja',
  \'indentation' : "\t",
  \}
"}}}

"set vim-rails
"{{{
"  noremap <C-1> RDmodel<CR>
"  noremap <C-2> REcontroller<CR>
"  noremap <C-3> RDview<CR>
"}}}

"COMMENT-OUT
"{{{
" Comment-out
let g:commentout_schemes = {
      \ '#': {
      \   1: { 'type': 'lhs',   'leader': '#'  },
      \ },
      \ 'c': {
      \   1: { 'type': 'wrap',  'leader': '/*',   'trailer': '*/' },
      \   3: { 'type': 'block', 'leader': '/*',   'trailer': '*/' },
      \ },
      \ 'cpp': {
      \   1: { 'type': 'lhs',   'leader': '//' },
      \   2: { 'type': 'wrap',  'leader': '/*',   'trailer': '*/' },
      \   3: { 'type': 'block', 'leader': '/*',   'trailer': '*/' },
      \ },
      \ 'html': {
      \   1: { 'type': 'wrap',  'leader': '<!--', 'trailer': '-->' },
      \   3: { 'type': 'block', 'leader': '<!--', 'trailer': '-->' },
      \ },
      \ 'vim': {
      \   1: { 'type': 'lhs',   'leader': '"'  },
      \ },
      \ }

let g:commentout_line_leaders  = []
let g:commentout_line_trailers = []
for scheme_group in values(g:commentout_schemes)
  for scheme in values(scheme_group)
    if scheme.type !=# 'block'
      if index(g:commentout_line_leaders,  scheme.leader) < 0
        call add(g:commentout_line_leaders,  scheme.leader)
      endif
      if has_key(scheme, 'trailer')
        if index(g:commentout_line_trailers, scheme.trailer) < 0
          call add(g:commentout_line_trailers, scheme.trailer)
        endif
      endif
    endif
  endfor
endfor

function! s:commentout_scheme_alias(orig, ...)
  for lang in a:000
    let g:commentout_schemes[lang] = g:commentout_schemes[a:orig]
  endfor
endfunction

call s:commentout_scheme_alias('#', 'ruby', 'perl', 'python', 'sh', 'zsh')
call s:commentout_scheme_alias('c', 'css')
call s:commentout_scheme_alias('cpp', 'java', 'javascript')
call s:commentout_scheme_alias('html', 'xhtml')

" Encomment
function! s:encomment_dwim(type, ...) range
  if !has_key(g:commentout_schemes, &l:filetype)
    echoerr "Comment-out scheme not registered for: " . &l:filetype
    return
  endif
  if !has_key(g:commentout_schemes[&l:filetype], a:type)
    echoerr "Comment-out scheme for `" . &l:filetype . "' not support type " . a:type
    return
  endif
  let scheme = g:commentout_schemes[&l:filetype][a:type]
  let range = a:firstline . ',' . a:lastline

  if scheme.type ==# 'lhs'
    execute ':'.range.'call s:encomment_line(scheme.leader, "", a:0)'
  elseif scheme.type ==# 'wrap'
    execute ':'.range.'call s:encomment_line(scheme.leader, scheme.trailer, a:0)'
  elseif scheme.type ==# 'block'
    execute ':'.range.'call s:encomment_block(scheme.leader, scheme.trailer, a:0)'
  endif
endfunction

function! s:encomment_line(lead, trail, with_copy) range
  let range = a:firstline . ',' . a:lastline
  let lead  = escape(a:lead, '/')
  let trail = escape(a:trail, '/')
  let lead_ws = '^ \{,' . strlen(a:lead) . '\}'

  if a:with_copy
    execute ':'.range.'yank v'
  endif
  if a:trail == ""
    " lhs comments
    silent execute ':'.range.'s/'.lead_ws.'/'.lead.'/'
  else
    " wrapping comments
    silent execute ':'.range.'s/'.lead_ws.'\(\s*\)\(.*\)$/'.lead.' \1\2 '.trail.'/'

    if exists(":Align") == 2
      execute ':'.range.'Align! p1P0 '.trail
      call s:post_align()
    endif
  endif
  if a:with_copy
    execute "normal! '>\"vp"
  endif
endfunction

function! s:encomment_block(lead, trail, with_copy) range
  let range =  a:firstline . ',' . a:lastline
  if a:with_copy
    execute ':'.range.'yank v'
  endif
  execute "normal! \<Esc>\<Esc>`<I\<CR>\<Esc>k0i" . a:lead . "\<Esc>" .
        \ '`>j0i' . a:trail . "\<CR>\<Esc>\<Esc>"
  if a:with_copy
    execute 'normal! "vP'
  endif
endfunction

" lhs comments
xnoremap <silent> ," :call <SID>encomment_line('"',  '', 0)<CR>
xnoremap <silent> ,; :call <SID>encomment_line(';',  '', 0)<CR>
xnoremap <silent> ,> :call <SID>encomment_line('> ', '', 0)<CR>

xnoremap <silent> ,," :call <SID>encomment_line('"',  '', 1)<CR>
xnoremap <silent> ,,; :call <SID>encomment_line(';',  '', 1)<CR>
xnoremap <silent> ,,> :call <SID>encomment_line('> ', '', 1)<CR>

" wrapping comments
xnoremap <silent> ,* :call <SID>encomment_line('/*', '*/', 0)<CR>
xnoremap <silent> ,< :call <SID>encomment_line('<!--', '-->', 0)<CR>

xnoremap <silent> ,,* :call <SID>encomment_line('/*', '*/', 1)<CR>
xnoremap <silent> ,,< :call <SID>encomment_line('<!--', '-->', 1)<CR>

" block comments
xnoremap <silent> <Leader>* :call <SID>encomment_block('/*',  '*/', 0)<CR>
xnoremap <silent> <Leader>< :call <SID>encomment_block('<!--', '-->', 0)<CR>

xnoremap <silent> <Leader><Leader>* :call <SID>encomment_block('/*', '*/', 1)<CR>
xnoremap <silent> <Leader><Leader>< :call <SID>encomment_block('<!--', '-->', 1)<CR>

" dwim
for nr in range(1,9)
 execute 'xnoremap <silent> ,' .nr ':call <SID>encomment_dwim('.nr.')<CR>'
 execute 'xnoremap <silent> ,,'.nr ':call <SID>encomment_dwim('.nr.', 1)<CR>'
endfor

xmap ,# ,1
xmap ,,# ,,1
xmap # ,#

" Decomment
function! s:decomment_dwim() range
  if !has_key(g:commentout_schemes, &l:filetype)
    echoerr "Comment-out scheme not registered for: " . &l:filetype
    return
  endif
  let range = a:firstline . ',' . a:lastline
  let block_leads  = []
  let block_trails = []
  let  line_leads  = []
  let  line_trails = []
  for scheme in values(g:commentout_schemes[&l:filetype])
    if scheme.type ==# 'block'
      call add(block_leads,  scheme.leader)
      call add(block_trails, scheme.trailer)
    else
      call add(line_leads, scheme.leader)
      if has_key(scheme, 'trailer')
        call add(line_trails, scheme.trailer)
      endif
    endif
  endfor
  let fst_line = getline(a:firstline)
  let lst_line = getline(a:lastline)
  let pat_block_leads  = '\(' . join(map(block_leads,  "util#escape_vregex(v:val)"), '\|') . '\)'
  let pat_block_trails = '\(' . join(map(block_trails, "util#escape_vregex(v:val)"), '\|') . '\)'
  if match(fst_line, pat_block_leads) && !match(fst_line, pat_block_trails) &&
        \ match(lst_line, pat_block_trails)
    " block comment
    execute ':'.range.'call s:decomment_block()'
  else
    " line comment
    execute ':'.range.'call s:decomment_line(line_leads, line_trails)'
  endif
endfunction

function! s:decomment_line(leads, trails) range
  let range = a:firstline . ',' . a:lastline
  if empty(a:leads)
    let leads = g:commentout_line_leaders
  else
    let leads = a:leads
  endif
  if empty(a:trails)
    let trails = g:commentout_line_trailers
  else
    let trails = a:trails
  endif
  let pat_leads  = '\(' . join(map(leads,  "util#escape_vregex(v:val, '/')"), '\|') . '\)'
  let pat_trails = '\(' . join(map(trails, "util#escape_vregex(v:val, '/')"), '\|') . '\)'

  silent! execute ':'.range.'s/^\s*'.pat_leads .'//'
  silent! execute ':'.range.'s/\s*' .pat_trails.'\s*$//'
  normal! `<=`>
endfunction

function! s:decomment_block() range
  execute "normal! \<Esc>\<Esc>'<\"_dd'>\"_dd"
endfunction

xnoremap <silent> ,/ :call <SID>decomment_line([], [])<CR>
xnoremap <silent> <Leader>/ :call <SID>decomment_block()<CR>

" dwim
xnoremap <silent> ,0 :call <SID>decomment_dwim()<CR>
xmap / ,0
"}}}

"vim-coffee-script
"{{{
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
"}}}
