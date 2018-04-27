set encoding=utf8
set fileencodings=iso-2022-jp,utf8,euc-jp,cp932
set ambiwidth=double
set clipboard=unnamedplus


"---------------------------------------------------------------------------
" ↓↓↓↓↓↓↓↓↓↓↓Windows時代の設定↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set noignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
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

"IMEをデフォルトでOFFにする
"set iminsert=0
"set imsearch=-1

"挿入モードを抜けたらIMEをOFFにする
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>


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
"バッファ移動
nnoremap <silent> [b    :bprevious<CR>
nnoremap <silent> ]b    :bnext<CR>
nnoremap <silent> [B    :bfirst<CR>
nnoremap <silent> ]B    :blast<CR>
"
"ノーマルモードでクイックフィックスリストをカーソルキーで移動
nnoremap <silent> [c :cprevious<CR>zz
nnoremap <silent> ]c :cnext<CR>zz
nnoremap <silent> [C :cfirst<CR>zz
nnoremap <silent> ]C :clast<CR>zz

"ウィンドウサイズの変更
nnoremap <silent> <C-UP>    <C-w>+
nnoremap <silent> <C-DOWN>  <C-w>-
nnoremap <silent> <C-LEFT>  <C-w>>
nnoremap <silent> <C-RIGHT> <C-w><
"
"***********************************************
"挿入モード
"***********************************************
"
"挿入モードでのhjkl移動
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

"括弧系を入力したら自動で中央にカーソル補正
"inoremap {} {}<Left>
"inoremap [] []<Left>
"inoremap () ()<Left>
"inoremap "" ""<Left>
"inoremap '' ''<Left>
"inoremap <> <><Left>

"挿入モード時Ctr+cで自動で/*  */を出力
inoremap <C-c> /*  */<Left><Left><Left>


"***********************************************
"コマンドモード
"***********************************************
"
"コマンドラインの履歴をカーソルキーでマッピングしフィルタリングするように設定
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


"***********************************************
"その他
"***********************************************
"
"F5で_vimrc再読み込み
"function! ReloadVimrc()
"  silent source C:\Users\kitada\Downloads\vim74-kaoriya-win64\_vimrc
"  silent source C:\Users\kitada\Downloads\vim74-kaoriya-win64\gvimrc
"endfunction
"
"map <F5> :call ReloadVimrc()<CR>

"---------------------------------------------------------------------------
" ファイル操作に関する設定:

" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

" その他ファイルの出力先変更

" backupfileの出力先
set backupdir=/home/kitada/tmp

" swapfileの出力先
set directory=/home/kitada/tmp

" undofileの出力先
set undodir=/home/kitada/tmp

"文字コード、改行コードをステータスバーに表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"

"---------------------------------------------------------------------------
" ↑↑↑↑↑↑↑↑↑↑↑↑Windows時代の設定↑↑↑↑↑↑↑↑↑↑↑↑↑↑
"---------------------------------------------------------------------------
