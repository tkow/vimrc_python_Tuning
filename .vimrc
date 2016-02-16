if 0 | endif

if &compatible
  set nocompatible
endif

syntax on

" 行番号を表示する
set number
" ターミナル接続を高速にする
set ttyfast
" スワップファイルを使わない
set noswapfile
" バックアップを使わない
set nowritebackup
set nobackup
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" 不可視文字の可視化
set list
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 補完の自動検出
set wildmode=list:longest,full
" 入力中のコマンドを表示する
set showcmd
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 対応する括弧やブレースを表示する
set showmatch
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 改行時に前の行のインデントを継続する
set autoindent
" カーソル移動の自由化
set virtualedit=all
" 対応カッコに<>を追加
set matchpairs& matchpairs+=<:>
" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 長いテキストの折り返し
set wrap
" エラーブザー音停止
set noerrorbells
" ヴィジュアルベル防止
set novisualbell
" ヒープ音防止
set visualbell t_vb=
" ファイル保存時に末尾の空白を取り除く
autocmd BufWritePre * :%s/\s\+$//ge
" カッコのハイライト時間を3秒に設定
set matchtime=3

if has('vim_starting')
set runtimepath^=~/.vim/bundle/neobundle.vim
endif
let $PATH = "~/.pyenv/shims:".$PATH
call neobundle#begin(expand('~/.vim/bundle/') )

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" " 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
" set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
   set clipboard& clipboard+=unnamedplus,unnamed
else
" set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00
   set clipboard& clipboard+=unnamed
endif

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

NeoBundleLazy "lambdalisue/vim-django-support", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"]
  \ }}

NeoBundleFetch 'Shougo/neobundle.vim'
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" " jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" " molokai
NeoBundle 'tomasr/molokai'
"
NeoBundle 'mattn/emmet-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
