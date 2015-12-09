set nocompatible

"Initialize and setup Vundle.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Let Vundle manage Vundle, required! Do not add comment at end of Plugin lines.
Plugin 'gmarik/Vundle.vim'
"List Plugins here.
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-bufferline'
Plugin 'andrwb/vim-lapis256'
Plugin 'Valloric/YouCompleteMe'
Plugin 'digitaltoad/vim-jade'
Plugin 'StanAngeloff/php.vim'
Plugin 'unblevable/quick-scope'
Plugin 'blackgate/tropikos-vim-theme'
Plugin 'kylef/apiblueprint.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'Haron-Prime/evening_vim'
Plugin 'mhumeSF/one-dark.vim'
Plugin 'djjcast/mirodark'
Plugin 'mxw/vim-jsx'
"All of Plugins must be added before the following line.
call vundle#end()

syntax on
filetype on
filetype plugin indent on

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

"Mappings.
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let @/=""<CR><Left>
nnoremap <Leader>C :w<Bar>bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>mks :mksession!<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>w :retab<CR>:wa<CR>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <Leader>p :set paste!<CR>:set paste?<CR>
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

let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_echo_current_diagnostic = 0
let g:ycm_show_diagnostics_ui = 0
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = 0
let g:bufferline_fname_mod = ':t'

"set rtp+=$HOME/.local/lib/python2.7/dist-packages/powerline/bindings/vim/
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

highlight ColorColumn ctermbg=248 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

set t_Co=256
set background=dark
colorscheme tropikos

