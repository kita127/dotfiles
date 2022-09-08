colorscheme desert
set guifont=MS_Gothic:h9:cSHIFTJIS
set guifontwide=MS_Gothic:h9

" メニューバー、ツールバー非表示
set guioptions=egrLt

" IME によってカーソルの色を変える
if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif


" haskell の qq で生文字列として扱うよう syntax highlight を設定
autocmd BufRead,BufNewFile *.hs syntax region hsTest start="\[r|" end="|\]"
autocmd BufRead,BufNewFile *.hs highlight link hsTest String
