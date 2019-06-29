set encoding=utf8
set fileencodings=utf8,iso-2022-jp,euc-jp,cp932
set ambiwidth=double
set clipboard=unnamedplus



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
set iminsert=0
set imsearch=-1

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
nnoremap <silent> [C :colder<CR>zz
nnoremap <silent> ]C :cnewer<CR>zz

nnoremap <silent> <Up>    :cprevious<CR>zz
nnoremap <silent> <Down>  :cnext<CR>zz
nnoremap <silent> <Left>  :colder<CR>zz
nnoremap <silent> <Right> :cnewer<CR>zz


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
" ファイル操作に関する設定 start

" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

" その他ファイルの出力先変更

" backupfileの出力先
set backupdir=/tmp

" swapfileの出力先
set directory=/tmp

" undofileの出力先
set undodir=/tmp

"文字コード、改行コードをステータスバーに表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"

" ファイル操作に関する設定 end
" -------------------------------------------------------------------------------

" -------------------------------------------------------------------------------
" dein start
" -------------------------------------------------------------------------------
"
" 1. お好みのプラグインを call dein#add() に追加する
" 2. :source % する
" 3. :call dein#install() する

" update
" :call dein#update()


if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif


  " git と連携
  call dein#add('tpope/vim-fugitive')

  " マークダウンビューワー
  " :Minidown で実行
  call dein#add('iwataka/minidown.vim')

  " ctrlp
  call dein#add('ctrlpvim/ctrlp.vim')

  " LSP クライアント
  call dein#add('autozimu/LanguageClient-neovim', {
      \ 'rev': 'next',
      \ 'build': 'bash install.sh',
      \ })

  call dein#end()
  call dein#save_state()
endif


filetype plugin indent on
syntax enable


" -------------------------------------------------------------------------------
" dein end
" -------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------
" Haskell IDE Engine & LanguageClient-neovim start
" ----------------------------------------------------------------------------------
"
" https://github.com/autozimu/LanguageClient-neovim

set rtp+=~/.cache/dein/repos/github.com/autozimu/LanguageClient-neovim_next

" If you're finding that the server isn't starting at the correct project root,
" it may also be helpful to also specify root markers:
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

" https://github.com/haskell/haskell-ide-engine
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'go': ['gopls'],
    \ }



"  (<C-x><C-o>) to open up the auto-complete menu,
"  or for asynchronous auto-completion, follow the setup instructions on LanguageClient.

" You'll probably want to add some mappings for common commands:
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>k :call LanguageClient#textDocument_hover()<CR>
map <Leader>g :call LanguageClient#textDocument_definition()<CR>
map <Leader>r :call LanguageClient#textDocument_rename()<CR>
map <Leader>f :call LanguageClient#textDocument_formatting()<CR>
map <Leader>b :call LanguageClient#textDocument_references()<CR>
map <Leader>a :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>s :call LanguageClient#textDocument_documentSymbol()<CR>

" If you'd like diagnostics to be highlighted,
" add a highlight group for ALEError/ALEWarning/ALEInfo,
" or customize g:LanguageClient_diagnosticsDisplay:

"hi link ALEError Error
"hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
"hi link ALEWarning Warning
"hi link ALEInfo SpellCap



" ----------------------------------------------------------------------------------
" LanguageClient-neovim end
" ----------------------------------------------------------------------------------

" -------------------------------------------------------------------------------
" 自作コマンド start
" -------------------------------------------------------------------------------

" 自動フォーマッター for haskell or コマンド
"au BufWritePost *.hs %!stylish-haskell
command Hfmt %!stylish-haskell

command Evimrc e $HOME/.vimrc

" -------------------------------------------------------------------------------
" 自作コマンド end
" -------------------------------------------------------------------------------

