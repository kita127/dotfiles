set encoding=utf8
set fileencodings=utf8,iso-2022-jp,euc-jp,cp932
set ambiwidth=double
set clipboard=unnamedplus
colorscheme desert
"colorscheme ron


"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" シンタックスハイライト有効
syntax on
" タブの画面上での幅
set tabstop=4
"シフトインデントの幅
set shiftwidth=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set noautoindent
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
" インクリメンタルサーチ有効
set incsearch

" クリップボードの使い方はデフォルト設定
set clipboard=

"IMEをデフォルトでOFFにする
set iminsert=0
set imsearch=-1

" 各 OS 固有の設定
if has("mac")
" mac用の設定

  " leader に '_' を設定
  let mapleader = "_"

  " 既に存在する sh を起動
  nnoremap <silent> ,g :sb sh<CR>

  " ノーマルモードに戻ったら IME をデフォルトにする
  " IME の調べ方はターミナルで `im-select` を実行すると現在選択中の IME の名前表示される
  " google 英数
  " let g:im_select_default = 'com.google.inputmethod.Japanese.Roman'
  " Apple 英数
  let g:im_select_default = 'com.apple.keylayout.ABC'
  " デフォルト日本語IME
  "let g:im_select_default = 'com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'

  set backupdir=/tmp
  set directory=/tmp
  set undodir=/tmp
elseif has("unix")
" unix固有の設定

  " 既に存在する sh を起動
  nnoremap <silent> ,g :sb sh<CR>

  set backupdir=/tmp
  set directory=/tmp
  set undodir=/tmp
elseif has("win64")
" 64bit_windows固有の設定

  "挿入モードを抜けたらIMEをOFFにする
  function! ImInActivate()
    call system('fcitx-remote -c')
  endfunction
  inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

  " 既に存在する cmd を起動
  nnoremap <silent> ,g :sb cmd<CR>

  set backupdir=%temp%
  set directory=%temp%
  set undodir=%temp%
elseif has("win32unix")
" Cygwin固有の設定
elseif has("win32")
" 32bit_windows固有の設定

  "挿入モードを抜けたらIMEをOFFにする
  function! ImInActivate()
    call system('fcitx-remote -c')
  endfunction
  inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

  " 既に存在する cmd を起動
  nnoremap <silent> ,g :sb cmd<CR>

  set backupdir=%temp%
  set directory=%temp%
  set undodir=%temp%
endif

" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21


" クイックフィックスリスト
nnoremap <silent> <Up>    :cprevious<CR>zz
nnoremap <silent> <Down>  :cnext<CR>zz
nnoremap <silent> <Left>  :colder<CR>zz
nnoremap <silent> <Right> :cnewer<CR>zz

" ローケーションリスト移動
nnoremap <silent> [b :lprevious<CR>zz
nnoremap <silent> ]b :lnext<CR>zz
nnoremap <silent> [B :lolder<CR>zz
nnoremap <silent> ]B :lnewer<CR>zz


"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:￫\ ,extends:<,trail:-,eol:↲


" 長い行を折り返して表示 (nowrap:折り返さない)
"set wrap
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

" 検索ハイライト
set hlsearch


"
"***********************************************
"ノーマルモード
"***********************************************
"
"隠しファイル有
set hidden
"



"
"***********************************************
"挿入モード
"***********************************************

"挿入モード時Ctr+cで自動で/*  */を出力
inoremap <C-c> /*  */<Left><Left><Left>

" Ctrl+^ で IME 切り替え
inoremap <C-Space> <C-^>


"***********************************************
"コマンドモード
"***********************************************
"
"コマンドラインの履歴をカーソルキーでマッピングしフィルタリングするように設定
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Ctrl+^ で IME 切り替え
cnoremap <C-Space> <C-^>

"***********************************************
"その他
"***********************************************



"---------------------------------------------------------------------------
" ファイル操作に関する設定 start
" -------------------------------------------------------------------------------

" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

"文字コード、改行コードをステータスバーに表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" nasm のときはハードタブ
autocmd BufRead,BufNewFile *.nas setlocal noexpandtab
autocmd BufRead,BufNewFile *.nas setlocal tabstop=4
autocmd BufRead,BufNewFile *.nas setlocal shiftwidth=4

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" -------------------------------------------------------------------------------
" ファイル操作に関する設定 end
" -------------------------------------------------------------------------------


" -------------------------------------------------------------------------------
" vim-plug start
" -------------------------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$HOME/.vim/plugged')

Plug 'https://github.com/junegunn/vim-plug'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/iwataka/minidown.vim'
Plug 'https://github.com/tyru/open-browser.vim'
Plug 'https://github.com/cocopon/vaffle.vim'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/AndrewRadev/linediff.vim'
Plug 'chrisbra/csv.vim'

if has("mac") || has("unix")

  Plug 'https://github.com/brglng/vim-im-select'

elseif has("win64") || has("win32")
endif


Plug 'https://github.com/kita127/mark.vim'
" Initialize plugin system
call plug#end()

" -------------------------------------------------------------------------------
" vim-plug end
" -------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------
" open browser start
" ----------------------------------------------------------------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nnoremap <Leader>o :<C-u>execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')<CR>

" ----------------------------------------------------------------------------------
" open browser end
" ----------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------
" vaffle start
" ----------------------------------------------------------------------------------
let g:vaffle_show_hidden_files = 1

" ----------------------------------------------------------------------------------
" vaffle end
" ----------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------
" ctrlp
" ----------------------------------------------------------------------------------
"  http://kien.github.io/ctrlp.vim/

" Prefix: s
nnoremap s <Nop>
nnoremap sa :<C-u>CtrlP<Space>
nnoremap sb :<C-u>CtrlPBuffer<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
"nnoremap sf :<C-u>CtrlP<CR>
nnoremap sl :<C-u>CtrlPLine<CR>
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
nnoremap sq :<C-u>CtrlPQuickfix<CR>
" nnoremap ss :<C-u>CtrlPMixed<CR>
nnoremap st :<C-u>CtrlPTag<CR>
nnoremap sc :<C-u>CtrlPClearAllCaches<CR>

" let g:ctrlp_map = '<Nop>'
let g:ctrlp_map = '<c-p>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
" dotfile も操作対象
let g:ctrlp_show_hidden = 1
" 正規表現モード ON
let g:ctrlp_regexp = 1
let g:ctrlp_switch_buffer = 0

" -------------------------------------------------------------------------------
" fugitive start
" -------------------------------------------------------------------------------

nnoremap s <Nop>
nnoremap ss :Gstatus<CR>

" -------------------------------------------------------------------------------
" fugitive end
" -------------------------------------------------------------------------------

" -------------------------------------------------------------------------------
" 自作コマンド start
" -------------------------------------------------------------------------------


" 自動フォーマッター for haskell or コマンド
"au BufWritePost *.hs %!stylish-haskell
command! Hfmt %!stylish-haskell
command! Goimports !goimports -w %

command! E e %:h

command! UpVimrc :source $MYVIMRC
command! UpGvimrc :source $MYGVIMRC

command! Evimrc :edit $MYVIMRC

" -------------------------------------------------------------------------------
" 自作コマンド end
" -------------------------------------------------------------------------------

" カラースキーム設定後に読み込む必要がある
source $HOME/.vim/plugged/mark.vim/plugin/mark.vim

