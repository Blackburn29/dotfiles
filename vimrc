
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

"All of Plugins must be added before the following line.
call vundle#end()
syntax on					"Enable syntax highlighting.
filetype on					"Enable filetype support.
filetype plugin indent on	"Enable filetype plugins.

set hidden				"Hides buffers instead of closes them.
set number				"Show line numbers.
set ruler				"Show the ruler.
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
set scrolloff=8			"Set number of lines above/below the cursor.
set sidescrolloff=8		"Set number of columns left/right of cursor.
set cursorline			"Highlight the current line.
set showmatch			"Highlight matching brace characters.
set incsearch			"Show search matches as you type.
set ignorecase			"Ignore case when searching.
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

autocmd FileType go set noexpandtab

let mapleader = ","		"Set the leader to ','.
"Map kj in insert mode to <Esc>
inoremap kj <Esc>
"Go to bash command editing.
nnoremap <Leader>c :!
"Insert line below cursor line.
nnoremap <Leader>o o<Esc><Up>
"Insert line above cursor line.
nnoremap <Leader>O O<Esc><Down>
"Clear highlighted search text.
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <Leader>e :E<CR>
"Useful as hell.
nnoremap ; :
"Quickly edit and source vimrc file.
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
"Quick mapping for mksession.
nnoremap <Leader>mks :mksession! Session.vim<CR>

if has("gui-running")
	set background=light
else
	set background=dark
endif
colorscheme lucius

nohlsearch
