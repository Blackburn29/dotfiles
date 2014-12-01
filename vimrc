
set nocompatible

"Initialize and setup Vundle.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Let Vundle manage Vundle, required! Do not add comment at end of Plugin lines.
Plugin 'gmarik/vundle'
"List Plugins here.
"Go plugin for vim. Not too impressed as of now.
Plugin 'fatih/vim-go'
"Lucius colorscheme.
Plugin 'jonathanfilip/vim-lucius'
"Coffeescript plugin
Plugin 'kchmck/vim-coffee-script'

"All of Plugins must be added before the following line.
call vundle#end()
syntax on					"Enable syntax highlighting.
filetype on					"Enable filetype support.
filetype plugin indent on	"Enable filetype plugins.

set hidden				"Hides buffers instead of closes them.
set number				"Show line numbers.
set nowrap				"Do not wrap lines.
set autoindent			"Always set autoindenting on.
set tabstop=4			"Set number of spaces per tab.
set shiftwidth=4		"Number of spaces to use for autoindenting.
set shiftround			"Use multiple of shiftwidth when using '<' and '>'.
set smarttab			"Insert tabs on start of line according to shiftwidth, not tabstop.
set expandtab			"Insert spaces instead of tabs.
if exists('+colorcolumn')
	set colorcolumn=80
endif
set showcmd				"Show the command that is being typed.	
set scrolloff=10		"Set number of lines above/below the cursor.
set sidescrolloff=10	"Set number of columns left/right of cursor.
set cursorline			"Highlight the current line.
set showmatch			"Highlight matching brace characters.
set incsearch			"Show search matches as you type.
set hlsearch			"Highlight search matchesv
set smartcase			"Use smartcase when searching.
set backspace=indent,eol,start				"Allow backspacing over everything in insert mode.
set history=1000		"Remember number of commands and search history.
set undolevels=1000		"Use number of levels for undo.
set wildignore=*.swp,*.bak,*.class,*.~		"Ignore filetypes with tab completion.
set visualbell			"Do not beep.
set noerrorbells		"Do not beep.
set nobackup			"Do not use backup files.
set lazyredraw			"Redraw only when vim needs to.

set statusline=
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=%l\/%L
set statusline+=\ \ 
set laststatus=2

set directory=$HOME/.vim/swapfiles//

autocmd FileType go set noexpandtab

let mapleader = " "
inoremap kj <Esc>
inoremap jk <Esc>
"Go to bash command editing.
nnoremap <Leader>c :!
"Insert line below cursor line.
nnoremap <Leader>o o<Esc>
"Insert line above cursor line.
nnoremap <Leader>O O<Esc>
"Clear highlighted search text.
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let@/=""<CR>
nnoremap <Leader>e :E<CR>
"Useful as hell.
nnoremap ; :
"Quickly edit and source vimrc file.
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
"Quick mapping for mksession.
nnoremap <Leader>mks :mksession! Session.vim<CR>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <S-H> gT
nnoremap <S-L> gt

if has("gui-running")
	set background=light
else
	set background=dark
endif
colorscheme lucius

