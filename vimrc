set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
"UI
Plug 'itchyny/lightline.vim'
Plug 'blueshirts/darcula'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'scrooloose/nerdtree'
"Editing Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()

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

"Netrw
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 20
"nnoremap <silent> <C-f> :Lexplore<CR>
nnoremap <silent> <C-f> :NERDTreeToggle<CR>

let g:neodark#use_256color = 1
let g:neodark#terminal_transparent = 1

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
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"Mappings.
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <LocalLeader>w :w!<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let @/=""<CR><Left>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>w :retab<CR>:wa<CR>
nnoremap <silent> <Leader><BS> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <silent> <Leader><Tab> :b#<CR>
nnoremap <silent> <Leader>c "+yy
vnoremap <silent> <Leader>c "+y
nnoremap _ ddp
nnoremap - ddkP
cnoremap kj <C-C>
inoremap kj <Esc>

set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


set completeopt=menu,menuone

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

set t_Co=256
set background=dark

"ale
highlight clear ALEErrorSign
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🔧'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

try
    colorscheme one
catch
endtry


"Line Warnings - Set after theme to override
highlight ColorColumn ctermbg=233 guibg=#1c1c1c
highlight CursorLine ctermbg=233 guibg=#1c1c1c
"let &colorcolumn="80,".join(range(120,999),",")
set colorcolumn=120


