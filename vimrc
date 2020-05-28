" Get rid of Japanese defaults
lan mes en_US.UTF8
set iminsert=0
set imsearch=0

" Standard stuff
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
silent! unmap <C-F>

" Change the mapleader from \ to ,
let mapleader=","

" Encoding options
set encoding=utf-8
setglobal fenc=utf-8

" Standard text options

set nu             " Line numbers
set nuw=8          " Stops the margin from resizing
set columns=88     " 80 columns + line numbers
set colorcolumn=+1 " Highlight 81st column

set tabstop=2
set sw=2
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab   " insert tabs on the start of a line according to
               " shiftwidth, not tabstop

set autoindent
set copyindent " copy the previous indentation on autoindenting
set expandtab
set cino=(1s   " C-indent options: Don't double-indent bracketed lines

set wrapmargin=0
set textwidth=80
set formatoptions=tcqron1B
set backspace=indent,eol,start " allow backspacing over everything

" Show special characters
set list
set listchars=tab:▸\ ,nbsp:.,trail:.

" Searching
set smartcase  " ignore case if search pattern is all lowercase,
               " case-sensitive otherwise
set hlsearch   " highlight search terms
set incsearch  " show search matches as you type
set showmatch  " ignore case when searching

" Fast window switching

nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
set wmh=0

" Tab moving

noremap <Leader><Left>  :tabmove -1<CR>
noremap <Leader><Right> :tabmove +1<CR>

" Tab shortcuts
" Thanks to Xidorn!

nmap <silent> <M-t> :tabnew<CR>
nmap <M-1> 1gt
nmap <M-2> 2gt
nmap <M-3> 3gt
nmap <M-4> 4gt
nmap <M-5> 5gt
nmap <M-6> 6gt
nmap <M-7> 7gt
nmap <M-8> 8gt
nmap <M-9> 9gt
nmap <silent> <M-0> :tablast<CR>

" Window splitting

" :Vsp - Do a vertical split but make it so the vertical axis is the primary
"        one and so that the file opened appears on the right
" :Vsta - likewise but use the given tag
command -complete=file -nargs=? Vsp bo vert split <args>
command -complete=tag -nargs=1 Vsta bo vert sta <args>

" Fast arg cycling

nmap <C-N> :update<CR>:n<CR>
nmap <C-P> :update<CR>:N<CR>

" Adjust indent of tabs

nmap <Tab> :'[,']><CR>
vmap <Tab> >
nmap <S-Tab> :'[,']<<CR>
vmap <S-Tab> <

" Preserve more history

set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo

" Ignore certain files when doing tab-completion
set wildignore=*.swp,*.tmp,*~

" Use backup dir if there is one
" (The // at the end makes it write the full path so that if you're editing
" files with the same name in different folders they don't conflict.)

set backupdir=./.backup//,~/.backup//,.
set directory=./.backup//,~/.backup//,.
set undodir=./.backup//,~/.backup//,.

" To make file watchers happy
set backupcopy=yes

" Enable local vimrc's
set exrc
set secure

" Don't prompt to reload changed files
set autoread

" Deal with long lines
set display=lastline

" GUI tweaks
set title        " change the terminal's title

" Highlight trailing whitespace
:au BufWinEnter *.{cpp,js,jsx,h} let w:m2=matchadd('ErrorMsg', '\s\+$', -1)

" Highlight full-width space
" http://qiita.com/kojionilk/items/67379e68cf54d811081a
augroup highlightIdeographicSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" Change working to directory to current buffer
autocmd BufEnter * silent! lcd %:p:h

" netrw tweaks
let g:netrw_banner       = 0 " No banner
let g:netrw_keepdir      = 0 " Update current working directory to match
                             "browsing direction
let g:netrw_sort_options = 'i' " Case-insensitive sort

" F2: Paste mode
set pastetoggle=<F2>

" F9: Open current buffer with the default app
nnoremap <silent> <F9> :!start /b cmd /cstart %:p<CR><CR>
imap <F9> <Esc>:update<CR><F9>

" F10: Open explorer showing the folder of the current buffer
nnoremap <silent> <F10> :!start explorer /select,%:p<CR><CR>
imap <F10> <Esc><F10>

" F12: Generate tags
set tags=tags;
nmap <F12> :execute "AsyncRun -cwd=" . ProjectRootGuess() "ctags --recurse --languages=C++,Rust --fields=+iaS --c++-kinds=+p --extras=+qf --langmap=C++:.c.h.cpp.idl.webidl --exclude=obj-\\* --exclude=node_modules"<CR>

" Turn on syntax highlighting
syn on
syntax enable

filetype plugin indent on

" Remove comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Clear search highlights on ,/
nmap <silent> ,/ :nohlsearch<CR>

" Rust options
autocmd Filetype rust setlocal ts=4 sw=4 tw=100

" Use ripgrep for grepping
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

" Turn off syntastic for C++ (it uses clang which seems to struggle with the
" mozilla/* include files)
let g:syntastic_mode_map = { 'passive_filetypes': ['cpp'] }

" Configure syntastic for tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " i.e. not tsc

" Prettier config
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#config_precedence = 'file-override'

" vim-clang-format config
let g:clang_format#command = $HOME . '/.mozbuild/clang-tools/clang-tidy/bin/clang-format'
