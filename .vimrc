"#### initialize  ####
set number            "行番号を表示
set nocompatible      "vi互換の動作を無効化
set expandtab         "タブをスペース化
set tabstop=2         "タブをスペース二つ分に
set shiftwidth=2      "インデントをスペース二つ分に

"#### run at vim starting  ####
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/')) "when this line is executed, {:filetype on} are performed simultaneously
let g:neobundle_default_git_protocol='https'

"#### let NeoBundle manage NeoBundle ####
NeoBundle 'Shougo/neobundle.vim'

"#### My Bundles here ####
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'nanotech/jellybeans.vim'           " jellybeansカラースキーマ
NeoBundle 'tomasr/molokai'                    " molokaiカラースキーマ
NeoBundle 'scrooloose/nerdtree'               " ファイルをtree表示
NeoBundle 'tpope/vim-rails'                   " Rails向けコマンドの提供
NeoBundle 'tpope/vim-endwise'                 " Ruby向けのend自動挿入
NeoBundle 'tomtom/tcomment_vim'               " コメントのON/OFFを手軽に実現
NeoBundle 'nathanaelkane/vim-indent-guides'   " インデントに色付け
NeoBundle 'bronson/vim-trailing-whitespace'   " ホワイトスペースの可視化
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'kana/vim-submode'

"#### vim-scripts repos ####
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'

NeoBundleCheck
call neobundle#end()

"#### key binding ####
nnoremap <S-h> ^
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <S-l> $

"#### NerdTree config ####
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-c> :Unite -auto-preview colorscheme<CR>

call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')

"#### colorscheme ####
colorscheme jellybeans
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
set background=dark

