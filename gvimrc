" Gvim only options

set diffexpr=MyDiff()
function! MyDiff()
  let opt = ''
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  silent execute '!diff -a ' . opt . '"' . v:fname_in . '" "' . v:fname_new . '" > "' . v:fname_out . '"'
endfunction

" Set window size
set lines=50 columns=88

" Initialise browse window to directory of current file
set browsedir=buffer

" Set fonts
set guifont=MS\ Gothic:h14
" set guifont=ƒ‚ƒgƒ„Lƒ}ƒ‹ƒxƒŠ3“™•:h14:cANSI
" Note it's also possible to use guifontwide to set a different font just for
" Japanese etc.


" Set colours
" highlight Normal guibg=#ffffcc
" highlight StatusLine guibg=white
" highlight StatusLineNC guibg=#ccccff

" Set Solarize theme
set background=light
colorscheme summerfruit256
