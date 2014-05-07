" プラグイン管理はpathogenを使用する
""---------------------------------------------------------
"" NeoBundle
""---------------------------------------------------------
"filetype off
"if has('vim_starting')
"	set runtimepath+=~/.vim/neobundle.vim.git
"	call neobundle#rc(expand('~/.vim/.bundle'))
"endif
"
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'Lokaltog/vim-easymotion'
"
"filetype plugin on
"filetype indent on
"
"---------------------------------------------------------
" EasyMotion
"---------------------------------------------------------
" JumpKey
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" Start EasyMotion key mapping
let g:EasyMotion_leader_key  =  '<Space><Space>'
" priority 1stroke
let g:EasyMotion_grouping=1
" color
hi EasyMotionTraget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue

"---------------------------------------------------------
" unite.vim
"---------------------------------------------------------
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit = 200
nmap ,uy :<C-u>Unite history/ynak<CR>
nmap ,ub :<C-u>Unite buffer<CR>
nmap ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap ,ur :<C-u>Unite -buffer-name=register register<CR>
nmap ,uu :<C-u>Unite file_mru buffer<CR>












"---------------------------------------------------------
" GUI固有ではない画面表示設定
"---------------------------------------------------------
" カラースキーム
colorscheme blue

" 行番号を表示
set number
" ルーラー表示
set ruler
" タブ改行を表示
set list
" タブ改行の表示設定
set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行の折り返し
set wrap
" 常にステータス行を表示
set laststatus=2
" コマンドラインの高さ
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" Syntax
syntax on


"---------------------------------------------------------
" 編集に関する設定
"---------------------------------------------------------
" タブ幅
set tabstop=4
" タブをスペースに展開しない
set noexpandtab
" 自動インデント
set autoindent
" C言語インデント
set cindent
" スマートインデント
set smartindent
" カーソルキーでの行末/行頭移動
set whichwrap=b,s,[,],<,>
" バックスペースでインデント改行削除
set backspace=indent,eol,start
" 検索時に最後までいったら最初に戻る
set wrapscan
" 対応する括弧強調表示
set showmatch
" コマンドライン補完強化
set wildmenu
" 自動折り返し日本語
set formatoptions+=mM

"---------------------------------------------------------------------------
" 検索
"---------------------------------------------------------------------------
"大文字小文字を区別しない
set ignorecase
"大文字小文字混在する場合は区別する
set smartcase
"インクリメンタルサーチ
set incsearch
"ハイライト
set hlsearch

"---------------------------------------------------------------------------
" インサートモードキーマップ
"---------------------------------------------------------------------------
noremap! <C-A> <home>
noremap! <C-E> <End>
noremap! <C-F> <Right>
noremap! <C-B> <Left>
noremap! <C-D> <Del>

"---------------------------------------------------------------------------
" ファイル操作に関する設定
"---------------------------------------------------------------------------
set nobackup
set noswapfile

