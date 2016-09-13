set nocompatible

"Initialize and setup Vundle.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Let Vundle manage Vundle, required! Do not add comment at end of Plugin lines.
Plugin 'gmarik/Vundle.vim'
"List Plugins here.
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-bufferline'
Plugin 'Shougo/neocomplete.vim'
Plugin 'unblevable/quick-scope'
Plugin 'blackgate/tropikos-vim-theme'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
"All of Plugins must be added before the following line.
call vundle#end()

syntax on
filetype on
filetype plugin indent on

"Keep menus closed in gVim on startup
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

"Allow toggling of the menu bars on gVim
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

"Neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Config.
set hidden
set number
set relativenumber
set nowrap
set autoindent
set nosmarttab
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set listchars=tab:▸\ ,eol:¬
set showcmd
set scrolloff=10
set sidescrolloff=10
set cursorline
set noshowmatch
set incsearch
set hlsearch
set gdefault
set smartcase
set novisualbell
set noerrorbells
set backspace=indent,eol,start
set listchars=eol:$,tab:>-
set nolist
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.~
set lazyredraw
set ttyfast
set splitbelow
set splitright

"Status line config.
set statusline=\ \ 
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=%l\/%L\ 
set statusline+=\ \ 
set laststatus=2

if &term =~ "xterm\\|rxvt"
    "insert mode
  let &t_SI = "\<Esc>]12;cyan\007"
  " default
  let &t_EI = "\<Esc>]12;grey\x7"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for terminal
endif

"Mappings.
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <LocalLeader>w :w!<CR>
nnoremap <silent> <C-f> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let @/=""<CR><Left>
nnoremap <Leader>C :w<Bar>bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>mks :mksession!<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>w :retab<CR>:wa<CR>
nnoremap <silent> <Leader><BS> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>e <C-W>l :e<space>
nnoremap <Leader>l <C-W>l
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <Leader>R *:%s///c<Left><Left>
nnoremap <silent> <Leader><Tab> :b#<CR>
nnoremap <silent> <Leader>1 :buffer 1<CR>
nnoremap <silent> <Leader>2 :buffer 2<CR>
nnoremap <silent> <Leader>3 :buffer 3<CR>
nnoremap <silent> <Leader>4 :buffer 4<CR>
nnoremap <silent> <Leader>5 :buffer 5<CR>
nnoremap <silent> <Leader>6 :buffer 6<CR>
nnoremap <silent> <Leader>7 :buffer 7<CR>
nnoremap <silent> <Leader>8 :buffer 8<CR>
nnoremap <Leader>= <C-W>=
nnoremap <silent> <Leader>c "+yy
nnoremap <Leader>q :q<CR>
vnoremap <silent> <Leader>c "+y
inoremap kj <Esc>
nnoremap ; :
nnoremap : ;
nnoremap <silent> <S-H> :bN<CR>
nnoremap <silent> <S-L> :bn<CR>
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap _ ddp
nnoremap - ddkP
cnoremap kj <C-C>

imap <C-s> <esc>a<Plug>snipMateNextOrTrigger
smap <C-s> <Plug>snipMateNextOrTrigger

set completeopt=menu,menuone

augroup EnterFileLineReturn
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

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

let g:go_fmt_command = "goimports"
highlight ColorColumn ctermbg=248 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

set t_Co=256
set background=dark
colorscheme tropikos

