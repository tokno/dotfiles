scriptencoding utf-8


" 環境毎の変数
if has('unix')
  let $VIM_PATH=expand('~/.vim')
elseif has('win64') || has('win32')
  let $VIM_PATH=expand('$VIM')
endif


if has('vim_starting')
  set runtimepath+=$VIM_PATH/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('$VIM_PATH/bundle/'))



" プラグイン
" ========================================

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" ステータス表示
NeoBundle 'itchyny/lightline.vim'

" カラースキーム
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/proton'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'lilydjwg/colorizer'


" プログラミング系
" ------------------------------
NeoBundle 'tyru/caw.vim'
NeoBundle 'thinca/vim-quickrun'

" Scala
NeoBundle 'derekwyatt/vim-scala'

" Haskell
NeoBundle 'dag/vim2hs'

" JavaScript
NeoBundle 'jelera/vim-javascript-syntax'

" html
NeoBundle 'mattn/emmet-vim'
NeoBundle 'valloric/MatchTagAlways'

" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'

" rails
NeoBundle 'basyura/unite-rails'


" エディタ機能拡張
" ------------------------------
" Surround
NeoBundle 'tpope/vim-surround'

" Ansi color
NeoBundle 'vim-scripts/AnsiEsc.vim'

" ファイラ
NeoBundle 'justinmk/vim-dirvish'

" submode
NeoBundle 'kana/vim-submode'


" 自動保存
NeoBundle 'vim-scripts/vim-auto-save'

" 検索
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'deris/vim-shot-f'

" 閉じを自動入力
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-endwise'

" vim-easy-align
NeoBundle 'junegunn/vim-easy-align'

" テキストオブジェクト
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'

" Unite.vim
NeoBundle 'Shougo/unite.vim'

" unite tag source
NeoBundle 'tsukkee/unite-tag'

" unite mark
NeoBundle 'tacroe/unite-mark'

" vim sibnature
NeoBundle 'kshenoy/vim-signature'

" context filetype
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'


" 変数
NeoBundle 'thinca/vim-editvar'

" 行末スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

set runtimepath+=~/.fzf


call neobundle#end()

" Required:
filetype plugin indent on



" エディタ環境
" ========================================

" シンタックスハイライト
syntax on

" 背景を黒に
set background=dark

" タブ表示
set showtabline=2

"行番号表示
set number

" 折り返しなし
set nowrap
autocmd FileType text setlocal textwidth=0

" no folding
set nofoldenable

" ファイル生成抑止
set noswapfile
set nobackup
set noundofile

" 検索
set incsearch
set noignorecase
set hlsearch

"クリップボード同期
if has('mac') || has('win64') || has('win32')
    set clipboard+=unnamed
else
    set clipboard=unnamedplus
endif

" Backspaceキーの影響範囲に制限を設けない
set backspace=indent,eol,start

" 数値を10進数として扱う
set nrformats=

" 検索時のエコーとintroを非表示
set shortmess+=s

" カーソルラインを表示する
set cursorline

" 余裕を持ってスクロール
set scrolloff=6
set sidescroll=1
set sidescrolloff=16

" モードを表示しない
set noshowmode

" コマンドラインモードでの補完
set wildmenu
set wildmode=list:longest,list:full

" マッチヒット有効化
runtime macros/matchit.vim

" 内容が変更されたら自動的に再読み込み
set autoread

" マクロなどの途中経過を描写しない
set lazyredraw

" インデント
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ファイルタイプ
autocmd BufNewFile,BufRead *.markdown,*.mkd,*.md,*.ft set filetype=markdown
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.vue set filetype=html

" エンコード設定
set encoding=utf-8
set fenc=utf-8


" インデント設定
" ========================================
augroup indent_setting
  autocmd!
  autocmd FileType html,javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType ruby,eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType haskell setlocal shiftwidth=4 tabstop=8 softtabstop=4
augroup END


" プラグイン設定
" ========================================

" lightline
set laststatus=2
let g:lightline = {
     \ 'tabline': {
     \   'left': [ [ 'tabs' ] ],
     \   'right': [  ],
     \ },
     \ 'colorscheme': 'jellybeans',
     \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
     \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
     \ }

" emmet.vim
let g:user_emmet_install_global = 0
let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<C-x>'

let g:user_emmet_settings = {
     \    'variables' : {
     \        'lang' : 'ja',
     \    },
     \    'html' : {
     \        'filters' : 'html',
     \        'indentation' : '  ',
     \        'expandos' : {
     \            'ol': 'ol>li',
     \            'list': 'ul>li*3',
     \        },
     \        'default_attributes': {
     \            'a': {'href': ''},
     \            'script': {'src': ''},
     \            'link': [{'rel': 'stylesheet'}, {'href': ''}],
     \        },
     \        'empty_element_suffix': ' />',
     \    },
     \ }

autocmd FileType html,css,eruby EmmetInstall


" caw.vim
let g:caw_no_default_keymappings=1


" MatchTagAlways
let g:mta_use_matchparen_group = 1


" auto-save
let g:auto_save = 1
let g:auto_save_silent = 1


" trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['unite']

let g:haskell_conceal = 0

" colorizer
let g:colorizer_nomap = 1

" quickrun
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "outputter/buffer/split" : ":botright",
\   },
\}

autocmd FileType quickrun AnsiEsc

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" unite grep で ag を使用
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" NeoComplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif


" shot-f
let g:shot_f_no_default_key_mappings = 1
nmap f <Plug>(shot-f-f)
nmap F <Plug>(shot-f-F)
xmap f <Plug>(shot-f-f)
xmap F <Plug>(shot-f-F)
omap f <Plug>(shot-f-f)
omap F <Plug>(shot-f-F)


" submode
let g:submode_keep_leaving_key = 1

call submode#enter_with('resize-window', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('resize-window', 'n', '', '<C-w>-', '<C-w>-')
call submode#enter_with('resize-window', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('resize-window', 'n', '', '<C-w><', '<C-w><')
call submode#map('resize-window', 'n', '', '+', '<C-w>+')
call submode#map('resize-window', 'n', '', '-', '<C-w>-')
call submode#map('resize-window', 'n', '', '>', '<C-w>>')
call submode#map('resize-window', 'n', '', '<', '<C-w><')

call submode#enter_with('tab-operation', 'n', '', 'gt', 'gt')
call submode#enter_with('tab-operation', 'n', '', 'gT', 'gT')
call submode#map('tab-operation', 'n', '', 't', 'gt')
call submode#map('tab-operation', 'n', '', 'T', 'gT')

call submode#enter_with('tab-operation', 'n', '', 'gl', 'gt')
call submode#enter_with('tab-operation', 'n', '', 'gh', 'gT')
call submode#map('tab-operation', 'n', '', 'l', 'gt')
call submode#map('tab-operation', 'n', '', 'h', 'gT')


" ========================================
" キーマップ変更
" ========================================

" 操作性改善
let mapleader=" "
nnoremap Y y$
xnoremap <C-g> g<C-g>
nnoremap Q :q!<CR>


" ESCでハイライト除去
noremap <C-@> <C-[>
inoremap <C-@> <C-[>
cnoremap <C-@> <C-[>
nnoremap <silent><C-@> :noh<CR>
nnoremap <silent><Esc><Esc> :noh<CR>


" emacs風キーバインド
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-h> <BS>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>


" quit
nnoremap <C-q> <Esc>:q<CR>


" コマンドライン操作
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" ノーマルモードで改行
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>


" ウィンドウ、タブ操作
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-w><C-w> <C-w><C-c>

nnoremap <Left> gT
nnoremap <Right> gt
nnoremap <silent><Up> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent><Down> :execute 'silent! tabmove ' . (tabpagenr() + 1)<CR>

nnoremap <Leader>t :tabe<CR>

" 検索
nnoremap n nzz
nnoremap N Nzz
nnoremap * viw"_y*N



" プラグイン
" ------------------------------

" dirvish
nnoremap <Leader>f :Dirvish<CR>

" incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" Unite
nnoremap <Leader>u :Unite -start-insert<CR>

" FZF
nnoremap <C-p> :FZF<CR>

" Unite buffer
nnoremap t :Unite buffer<CR>

" unite-rails key mapping.
function! s:rails_config()
    let root = unite#sources#rails#helper#rails_root()
    if root != ""
        nnoremap <buffer> U :Unite -start-insert<CR>rails/
        nnoremap gv :Unite -start-insert -no-split -smartcase rails/view<CR>
        nnoremap gm :Unite -start-insert -no-split -smartcase rails/model<CR>
        nnoremap gc :Unite -start-insert -no-split -smartcase rails/controller<CR>
        nnoremap gr :Unite -start-insert -no-split -smartcase rails/route<CR>
        nnoremap gd :Unite -start-insert -no-split -smartcase rails/db<CR>
        nnoremap gh :Unite -start-insert -no-split -smartcase rails/helper<CR>
        nnoremap ga :Unite -start-insert -no-split -smartcase rails/asset<CR>
        nnoremap gs :Unite -start-insert -no-split -smartcase rails/spec<CR>
    endif
endfunction

augroup rails_mapping
    autocmd!
    autocmd BufRead * :call s:rails_config()
augroup END

" Unite mark
nnoremap <Leader>m :Unite mark<CR>


" caw.vim
nmap J <Plug>(caw:i:toggle) j
vmap J <Plug>(caw:wrap:toggle)

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)


" emmet
augroup emmet_mapping
  autocmd!
  autocmd FileType html,css,eruby imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup END


" ローカル設定を読みこみ
if filereadable($HOME . "/.vimrc.local" )
  source ~/.vimrc.local
endif

