set guioptions=
set cmdheight=1

set background=dark
colorscheme hybrid

" ローカル設定を読みこみ
if filereadable($HOME . "/.gvimrc.local" )
  source ~/.gvimrc.local
endif

