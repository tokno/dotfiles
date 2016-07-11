scriptencoding utf-8

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" install dein.vim
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

set runtimepath+=~/.fzf


" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグイン
  " ========================================
  call dein#add('Shougo/dein.vim')

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  " status line
  call dein#add('itchyny/lightline.vim')

  call dein#add('morhetz/gruvbox')
  call dein#add('lilydjwg/colorizer')


  " Programming
  " ------------------------------
  call dein#add('majutsushi/tagbar')
  call dein#add('tyru/caw.vim')
  call dein#add('thinca/vim-quickrun')

  " Haskell
  call dein#add('dag/vim2hs')

  " JavaScript
  call dein#add('jelera/vim-javascript-syntax')

  " html
  call dein#add('mattn/emmet-vim')
  call dein#add('valloric/MatchTagAlways')


  " Editor
  " ------------------------------
  " Surround
  call dein#add('tpope/vim-surround')

  " Ansi color
  call dein#add('vim-scripts/AnsiEsc.vim')

  " ファイラ
  call dein#add('justinmk/vim-dirvish')

  " submode
  call dein#add('kana/vim-submode')


  " 自動保存
  call dein#add('vim-scripts/vim-auto-save')

  " 検索
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('rking/ag.vim')
  call dein#add('bronson/vim-visual-star-search')
  call dein#add('deris/vim-shot-f')

  " 閉じを自動入力
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-endwise')

  " vim-easy-align
  call dein#add('junegunn/vim-easy-align')

  " テキストオブジェクト
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-indent')

  " Unite.vim
  call dein#add('Shougo/unite.vim')

  " unite tag source
  call dein#add('tsukkee/unite-tag')

  " unite mark
  call dein#add('tacroe/unite-mark')

  " vim signature
  call dein#add('kshenoy/vim-signature')


  " 行末スペースを可視化
  call dein#add('bronson/vim-trailing-whitespace')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

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
set nowrapscan

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
  autocmd FileType html,javascript,css setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType ruby,eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType yaml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType haskell setlocal shiftwidth=4 tabstop=8 softtabstop=4
augroup END


" プラグイン設定
" ========================================

" gruvbox
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'

" lightline
set laststatus=2
let g:lightline = {
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
     \   'right': [ [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
     \ },
     \ 'inactive': {
     \   'left': [ [ 'filename' ] ],
     \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
     \ },
     \ 'tabline': {
     \   'left': [ [ 'tabs' ] ],
     \   'right': [  ],
     \ },
     \ 'colorscheme': 'gruvbox',
     \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
     \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
     \ }

" tagbar
let g:tagbar_width = 50

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

autocmd FileType html,css,eruby,php EmmetInstall


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

" Unite mark
nnoremap <Leader>m :Unite mark<CR>


" tagbar
nnoremap <Leader>l :TagbarToggle<CR>


" caw.vim
nmap J <Plug>(caw:i:toggle) j
vmap J <Plug>(caw:wrap:toggle)

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)


" emmet
augroup emmet_mapping
  autocmd!
  autocmd FileType html,css,eruby,php imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup END


" ローカル設定を読みこみ
if filereadable($HOME . "/.vimrc.local" )
  source ~/.vimrc.local
endif

