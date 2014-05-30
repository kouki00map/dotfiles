"---------------------------------------------------------
" NeoBundle
"---------------------------------------------------------
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/.bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/.bundle'))
endif

NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplte.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'haya14busa/vim-migemo'
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin on
filetype indent on



" ===========================================
" pathogen
" ===========================================
" call pathogen#infect()
" call pathogen#helptags()




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
nmap ,uy :<C-u>Unite history/yank<CR>
nmap ,ub :<C-u>Unite buffer<CR>
nmap ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap ,ur :<C-u>Unite -buffer-name=register register<CR>
nmap ,uu :<C-u>Unite file_mru buffer<CR>



" ===========================================
" neosnippet.vim
" ===========================================
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ===========================================
" switch.vim
" ===========================================
nnoremap <Space>s  :<C-u>Switch<CR>

" ===========================================
" over.vim
" ===========================================

" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" ===========================================
" lightline
" ===========================================
let g:lightline = {
	\ 'colorscheme': 'default'
	\}

"---------------------------------------------------------
" GUI固有ではない画面表示設定
"---------------------------------------------------------
" カラースキーム
colorscheme blue

" 行番号を表示
set number
" カーソル行の背景色
set cursorline
" カーソル位置の絡む背景色
set cursorcolumn
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
set shiftwidth=4
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
" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]
" 上下8行の視界を確保
set scrolloff=8


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

