" *******************************************
" * Plugin                                  *
" *******************************************

" ===========================================
" pathogen
" ===========================================
call pathogen#incubate()
call pathogen#helptags()

" ===========================================
" EasyMotion
" ===========================================
" JumpKey
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" Start EasyMotion key mapping
let g:EasyMotion_leader_key=";"
" priority 1stroke
let g:EasyMotion_grouping=1
" color
hi EasyMotionTraget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue


" ===========================================
" YankRing
" ===========================================
nmap ,y :YRShow<CR>

" ===========================================
" Unite	
" ===========================================
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit = 200
nmap ,uy :<C-u>Unite history/ynak<CR>
nmap ,ub :<C-u>Unite buffer<CR>
nmap ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap ,ur :<C-u>Unite -buffer-name=register register<CR>
nmap ,uu :<C-u>Unite file_mru buffer<CR>

" ===========================================
" Vimfiler
" ===========================================
nmap <Leader>f :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" ===========================================
" CD currenq
" ===========================================
source $VIMRUNTIME/macros/cd.vim

" ===========================================
" neocomplcache
" ===========================================
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Smartcase
let g:neocomplcache_enable_smart_case = 1
" Camelcase
let g:neocomplcache_enable_camel_case_completion = 1
" 区切り文字
let g:neocomplcache_enable_underbar_completion = 1

"最小文字長
let g:neocomplcache_min_syntax_length = 3

let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" ===========================================
" neosnippet
" ===========================================
" 2013/01/19 19:20最新のREADMEのものを反映
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif







" *******************************************
" *                                         *
" * Vim Setting                             *
" *                                         *
" *******************************************
"---------------------------------------------------------------------------
" 日本語対応のための設定:
"---------------------------------------------------------------------------
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
source $VIMRUNTIME/bundle/kaoriya/encode_japan.vim
" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif
" 日本語入力用のkeymapの設定例 (コメントアウト)
if has('keymap')
  " ローマ字仮名のkeymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif
" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

" vimrc編集
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
" vimrc読み込み
nnoremap <Space>, :<C-u>source $MYVIMRC<CR>

" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"---------------------------------------------------------------------------
" 行番号を表示 (nonumber:非表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
colorscheme hybrid " (Windows用gvim使用時はgvimrcを編集すること)
"Syntax
syntax on

"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 自動インデントの幅
set shiftwidth=4
" C言語インデント
set cindent
" スマートインデント
set smartindent
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
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

"---------------------------------------------------------------------------
" ファイル操作に関する設定
"---------------------------------------------------------------------------
set clipboard+=unnamed
