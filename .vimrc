set number          " Show line numbers
set relativenumber  " Show relative line numbers
set ruler           " Show cursor position at all times

set tabstop=2       " Width of a tab
set shiftwidth=2    " Number of spaces when autoindenting
set expandtab       " Use spaces instead of tabs
set smartindent     " Smart indentation

set hlsearch        " Highlight last search
set incsearch       " Highlight search while being typed
set ignorecase      " Ignore case when searching
set smartcase       " Case-sensitive search when pattern contains upper case characters

set scrolloff=10    " Keep a margin to top/bottom of the file

set wildmenu
set wildmode=longest:full,full

set hidden          " Switch buffers without saving

" Make true colors work for themes
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
" \   'rust': ['rustfmt', 'rls'],
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'rust': ['rustfmt'],
\}

" keep preview window always opened
let g:ale_close_preview_on_insert = 0

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-obsession'
Plug 'preservim/vim-markdown'
Plug 'tpope/vim-fugitive'
call plug#end()

command! Light
  \ set background=light |
  \ colorscheme PaperColor

command! Dark
  \ colorscheme embark |
  \ hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f |
  \ hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac |
  \ hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0 |
  \ hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

Dark

" navigate completions using CTRL-J and CTRL-K
inoremap <silent><expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <silent><expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" i -> ALEHover
inoremap <F9> <C-o>:ALEHover<CR>
nnoremap <F9> :ALEHover<CR>

" navigate errors using F8 and F7
nnoremap <F8> :ALENextWrap<CR>
nnoremap <F7> :ALEPreviousWrap<CR>

nnoremap <F12> :ALEGoToDefinition<CR>
nnoremap <F11> :ALEGoToImplementation<CR>
nnoremap <F10> :ALEGoToTypeDefinition<CR>

" folding in vim-markdown does not work (folds disapear)
let g:vim_markdown_folding_disabled = 1
