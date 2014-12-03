
set nocompatible

"Initialize and setup Vundle.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Let Vundle manage Vundle, required! Do not add comment at end of Plugin lines.
Plugin 'gmarik/vundle'
"List Plugins here.
Plugin 'fatih/vim-go'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'kchmck/vim-coffee-script'

"All of Plugins must be added before the following line.
call vundle#end()

syntax on
filetype on
filetype plugin indent on

"Config.
set hidden
set number
set nowrap
set autoindent
set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
if exists('+colorcolumn')
	set colorcolumn=80
endif
set showcmd
set scrolloff=10
set sidescrolloff=10
set cursorline
set noshowmatch
set incsearch
set hlsearch
set smartcase
set novisualbell
set noerrorbells
set title
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.~
set lazyredraw

"Status line config.
set statusline=
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=%l\/%L
set statusline+=\ \ 
set laststatus=2

"Backups.
set backupdir=~/.vim/tmp/back//,.
set directory=~/.vim/tmp/swp//,.
if exists('+undodir')
    set undodir=~./vim/tmp/undo,.
endif
if exists('+undofile')
    set undofile
endif

autocmd FileType go set noexpandtab

"Mappings.
let mapleader = " "
let maplocalleader = ","
inoremap kj <Esc>
inoremap jk <Esc>
nnoremap ; :
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let@/=""<CR>
nnoremap <Leader>c :!
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>mks :mksession! Session.vim<CR>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap _ ddp
nnoremap - ddkP
nnoremap D ^C

"Color scheme.
if has("gui-running")
	set background=light
else
	set background=dark
endif
colorscheme lucius

