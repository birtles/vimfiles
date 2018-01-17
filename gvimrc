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

" Detect a new vertical split, and double the width of the window
function! ResizeWindow()
  if winwidth('%') == 44 && &columns == 88
    set columns=177
    execute "normal! \<c-w>="
  endif
endfunction
autocmd WinNew * call ResizeWindow()

" Initialise browse window to directory of current file
set browsedir=buffer

" Turn off scrollbars and tab button bar since they seem to cause window
" resizing issues on Ubuntu
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=b
set guioptions-=h
set guioptions-=e

" Set fonts
if has("gui_win32")
  set guifont=モトヤLマルベリ3等幅:h12,Consolas:h14,MS\ Gothic:h16
else
  set guifont=Monospace\ 15
endif
" Note it's also possible to use guifontwide to set a different font just for
" Japanese etc.


" Set colours
" highlight Normal guibg=#ffffcc
" highlight StatusLine guibg=white
" highlight StatusLineNC guibg=#ccccff

" Set Solarize theme
set background=light
colorscheme summerfruit256
