""""""""""""""""""""""""""""""
" 初期設定
""""""""""""""""""""""""""""""
set number            "行番号を表示
set nocompatible      "vi互換の動作を無効化
set expandtab         "タブをスペース化
set tabstop=2         "タブをスペース二つ分に
set shiftwidth=2      "インデントをスペース二つ分に
set autoindent        "オートインデント

""""""""""""""""""""""""""""""
" プラグインのセットアップ
" 追加時に:PlugInstallを実行
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" カラースキーマ
Plug 'junegunn/seoul256.vim'
" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle'] }
" ウィンドウリサイズ（Ctrl+eで分割ウィンドウリサイズモード、Ctrl+Eでvimウィンドウ自体のリサイズモード）
" Ctrl+eが$のエイリアスとかぶるのでコメントアウト
" Plug 'simeji/winresizer'

call plug#end()

""""""""""""""""""""""""""""""
" キーバインド
""""""""""""""""""""""""""""""
noremap k gk
noremap j gj
nnoremap ; :
nnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-a> ^
vnoremap <C-e> $
nnoremap to :tabnew<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
command Nt NERDTreeToggle

" ノーオペレーション設定
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" ヘルプ非表示
noremap <F1> <Nop>
noremap! <F1> <Nop>
nnoremap Q <Nop>

""""""""""""""""""""""""""""""
" カラースキーマ
""""""""""""""""""""""""""""""
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colo seoul256

""""""""""""""""""""""""""""""
" NERDTree設定
""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

