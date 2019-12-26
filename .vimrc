if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"



""""" Random

set nobackup
set autoindent
set number

set scrolloff=10
set wildmenu
set wildmode=list:longest

set background=dark

set tabstop=4
set shiftwidth=4
set expandtab ts=4 sw=4 ai

""""" Coding style

highlight ColorColumn ctermbg=gray
set colorcolumn=81

""""" Spelling

command Spellfr set spelllang=fr spell
command Spellen set spelllang=en spell
command Nospell set nospell

""""" Makenote

map <C-K> :wa<CR>:! makenote<CR>
inoremap <C-K> <Esc>:wa<CR>:! makenote<CR>i<Right>

""""" Latex

map <C-J> :wa<CR>:! pdflatex main.tex<CR>
inoremap <C-J> <Esc>:wa<CR>:! pdflatex main.tex<CR>i<Right>

""""" Words wraping

" Restructure paragraph
map <C-P> :set tw=80<CR>gq}
inoremap <C-P> <Esc>:set tw=80<CR>gq}i<Right>

""""" Saving & Quitting

" Save all buffers
map <C-L> :wa<CR>
inoremap <C-L> <Esc>:wa<CR>i<Right>

" Save session, all buffers and close vim
map <C-E> :mksession! .session.vim<CR>:wa<CR>:qa<CR>
inoremap <C-E> <Esc>:mksession! .session.vim<CR>:wa<CR>:qa<CR>

""""" Windows & Tabs

" Split vertically
map <C-N> :vsplit<CR>
inoremap <C-N> <Esc><Right>:vsplit<CR>i

" Close current buffer
map <C-C> :bd<CR>
inoremap <C-C> <Esc>:bd<CR>i

" Moving between windows
map <C-Left> <C-W><Left>
inoremap <C-Left> <Esc><C-W><Left>i<Right>
map <C-Right> <C-W><Right>
inoremap <C-Right> <Esc><C-W><Right>i<Right>
map <C-Up> <C-W><Up>
inoremap <C-Up> <Esc><C-W><Up>i<Right>
map <C-Down> <C-W><Down>
inoremap <C-Down> <Esc><C-W><Down>i<Right>

" Moving between tabs
map <A-Left> gT
inoremap <A-Left> <Esc>gTi<Right>
map <A-Right> gt
inoremap <A-Right> <Esc>gti<Right>
