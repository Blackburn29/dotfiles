
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
Plugin 'scrooloose/nerdtree'

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
set backspace=indent,eol,start
set nolist
set listchars=eol:$,tab:>-
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.~
set lazyredraw

"Status line config.
set statusline=\ \ 
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=%l\/%L\ 
set statusline+=\ \ 
set laststatus=2

"Mappings.
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let @/=""<CR>
nnoremap <Leader>c :w<Bar>bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>mks :mksession!<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <Leader>p :set paste!<CR>:set paste?<CR>
inoremap kj <Esc>
inoremap jk <Esc>
nnoremap ; :
nnoremap <S-H> :bN<CR>
nnoremap <S-L> :bn<CR>
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap _ ddp
nnoremap - ddkP

"Backups.
function! s:EnsureDirectoryExists(path)
    if empty(glob(a:path))
        if !mkdir(a:path, "p")
            echoerr "Could not create directory \"" . a:path . "\""
        else
            return 1
        endif
    endif
    return 1
endfunction

let s:backupDirPath = $HOME . "/.vim/tmp/back/"
if s:EnsureDirectoryExists(s:backupDirPath)
    let &backupdir = s:backupDirPath
endif

let s:swapDirectoryPath = $HOME . "/.vim/tmp/swp/"
if s:EnsureDirectoryExists(s:swapDirectoryPath)
    let &directory = s:swapDirectoryPath . "/"
endif

if exists('+undodir')
    let s:undoDirPath = $HOME . "/.vim/tmp/undo/"
    if s:EnsureDirectoryExists(s:undoDirPath)
        let &undodir = s:undoDirPath
    endif
endif
if exists('+undofile')
    set undofile
endif

"Util functions.
function! EEBufferCount()
    return len(filter(range(1, bufnr("$")), 'buflisted(v:val)'))
endfunction

"Color scheme.
if has("gui-running")
	set background=light
else
	set background=dark
endif
colorscheme lucius
