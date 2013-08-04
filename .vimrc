syntax enable
set number
set noswapfile
colorscheme solarized

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
nnoremap <Space>, :<C-u>source $MYVIMRC<CR>

" ===========================================
" NeoBundle
" ===========================================
if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim.git
	call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'altercation/vim-colors-solarized'

" ===========================================
" vim-easymotion
" ===========================================
NeoBundle 'Lokaltog/vim-easymotion'
" �z�[���|�W�V�����ɋ߂��L�[���g��
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" �u'�v + �����Ƀ}�b�s���O
let g:EasyMotion_leader_key="'"
" 1 �X�g���[�N�I����D�悷��
let g:EasyMotion_grouping=1
" �J���[�ݒ�ύX
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" ===========================================
" YankRing
" ===========================================
" �y�[�X�g���s��Ctrl-P�A�܂���Ctrl-N
NeoBundle 'YankRing.vim'
nmap ,y :YRShow<CR>

" ===========================================
" Unite
" ===========================================
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit = 200
nmap ,uy :<C-u>Unite history/ynak<CR>
nmap ,ub :<C-u>Unite buffer<CR>
nmap ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap ,ur :<C-u>Unite -buffer-name=register register<CR>
nmap ,uu :<C-u>Unite file_mru buffer<CR>

" ===========================================
" Powerline
" ===========================================
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}


filetype plugin on
filetype indent on
