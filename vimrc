set nocompatible
"set fileformat
set fileformats=unix,dos,mac
set fileformat=unix

"Set colorscheme
"{{{
if !has("gui_running")
  set t_Co=256
endif
set background=dark
colorscheme peaksea
"}}}

"set transparency
"{{{
if has('kaoriya')
  set transparency=20
endif
"}}}

"User Setting Sequence
"{{{
set nobackup
set noswapfile
set number
set clipboard+=unnamed
set textwidth=118
set whichwrap=b,s,h,s,<,>,[,]
set statusline+=✘╹◡╹✘
set statusline+=[%F]
set statusline+=[%Y]
set statusline+=[%{&fileencoding}]
set statusline+=[%{&fileformat}]
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
augroup gui_color_scheme
  au!
  execute 'autocmd GUIEnter * colorscheme' scheme
  set background=dark
augroup END
" Rails file association
augroup RubyOnRails
  au!
  au FileType ruby :set nowrap tabstop=2 tw=0 sw=2
  au BufNewFile *.rb set ft=ruby fenc=utf-8
  au FileType eruby :set nowrap tabstop=2 tw=2 sw=2
  au BufNewFile *.html.erb set filetype=eruby fenc=utf-8
  au BufNewFile,BufRead *.erb set ft=eruby.html fenc=utf-8
augroup END
if !has('gui_running')
  autocmd RubyOnRails
endif
"}}}

" User Key Mapping
"{{{
nnoremap <C-h>    <C-w>h
nnoremap <C-l>    <C-w>l
nnoremap <C-j>    <C-w>j
nnoremap <C-k>    <C-w>k
inoremap <C-UP>   <C-w>h
nnoremap <C-UP>   <C-w>h
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
filetype off                   " Required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" After install, turn shell $VIM/vimfiles/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
  \'build':{
    \'unix':'make -f make_unix.mak',
    \'mac':'make -f make_mac.mak',
  \},
\}
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
" Original repos on github
"NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'alpaca-tc/html5.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'lunaru/vim-less'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'szw/vim-tags'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundleLazy 'alpaca-tc/alpaca_rails_support', {
      \ 'depends' : ['Shougo/neocomplete.vim', 'tpope/vim-rails', 'Shougo/vimproc', 'Shougo/unite.vim'],
      \ 'autoload': {
      \   'insert' : 1,
      \   'unite_sources' : 'rails_support/locales',
      \   'commands' : [
      \     'RSCreateRoutesCache', 'RSCleanCache',
      \     'RSShowLocale', 'RSCreateLocaleCache',
      \   ]
      \ }}
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

"neocomplete
"{{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'coffee' : $HOME.'/.vim/dict/coffee.dict',
  \ 'eruby' : $HOME.'/.vim/dict/eruby.dict',
  \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
  \ 'rails' : $HOME.'/.vim/dict/rails.dict',
  \ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
  \ 'sass' : $HOME.'/.vim/dict/sass.dict',
  \ 'scss' : $HOME.'/.vim/dict/scss.dict',
  \ 'vimshell' : $HOME.'/.vimshell_hist'
  \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" Enable omni completion.
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\|[@!]'
"}}}

"NeoSnipet
"{{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}

"AlpacaRailsSupport
"{{{
" `:RSCreateRoutesCache`
" inoremap <expr><C-X><C-R> neocomplete#start_manual_complete('rails/url_helper')
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
let g:quickrun_config['scss.css']={ 'type': 'scss'}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
let g:quickrun_config._ = {'runner' : 'vimproc'}

" rspecを実行するための設定を定義する
" %cはcommandに設定した値に置換される
" %oはcmdoptに設定した値に置換される
" %sはソースファイル名に置換される
let g:quickrun_config['ruby.rspec'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'outputter': 'buffered:target=buffer',
  \ 'exec': 'bundle exec %c %o --color --drb --tty %s'
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
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>
"}}}

"zen-coding
"{{{
let g:user_zen_settings={
  \'lang' : 'ja',
  \'indentation' : "\s",
  \}
"}}}

"set vim-rails
"{{{
"  noremap <C-1> RDmodel<CR>
"  noremap <C-2> REcontroller<CR>
"  noremap <C-3> RDview<CR>
"}}}

"vim-coffee-script
"{{{
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
"}}}

"Unite rails
"{{{
nnoremap <F1> :Unite rails/model<CR>
inoremap <F1> <Esc><F1>
nnoremap <F2> :Unite rails/view<CR>
inoremap <F2> <Esc><F2>
nnoremap <F3> :Unite rails/controller<CR>
inoremap <F3> <Esc><F3>
nnoremap <F4> :Unite rails/helper<CR>
inoremap <F4> <Esc><F4>
nnoremap <F5> :Unite rails/stylesheet<CR>
inoremap <F5> <Esc><F5>
nnoremap <F6> :Unite rails/javascript<CR>
inoremap <F6> <Esc><F6>
nnoremap <F7> :Unite rails/spec
inoremap <F7> <Esc><F7>
nnoremap <F9> :Unite rails/route<CR>
"}}}

"Ctags
"{{{
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
"}}}

