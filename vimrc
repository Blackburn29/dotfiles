
set nocompatible

"Initialize and setup Vundle.
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
"Let Vundle manage Vundle, required! Do not add comment at end of Bundle lines.
Bundle 'gmarik/vundle'
"List Bundles here.
"Go plugin for vim. Not too impressed as of now.
Bundle 'fatih/vim-go'
"Lucius colorscheme.
Bundle 'jonathanfilip/vim-lucius'

set hidden				"Hides buffers instead of closes them.
set number				"Show line numbers.
set ruler				"Show the ruler.
set nowrap				"DO not wrap lines.
set autoindent			"Always set autoindenting on.
set tabstop=4			"Set number of spaces per tab.
set shiftwidth=4		"Number of spaces to use for autoindenting.
set shiftround			"Use multiple of shiftwidth when using '<' and '>'.
set smarttab			"Insert tans on start of line according to shiftwidth, not tabstop.
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

let mapleader = ","		"Set the leader to ','.
"Map kj in insert mode to <Esc>
inoremap kj <Esc>
"Map Control Space to Eclipse-like auto completion.
inoremap <C-Space> <C-x><C-o>
"Go to bash command editing.
nnoremap <Leader>c :!
"Scope dependent variable renaming.
nnoremap <Leader>r *Ngd:%s///gc<Left><Left><Left>
"Scope independent variable renaming.
nnoremap <Leader>R *NgD:%s///gc<Left><Left><Left>
"Insert line below cursor line.
nnoremap <Leader>o o<Esc><Up>
"Insert line above cursor line.
nnoremap <Leader>O O<Esc><Down>
"Clear highlighted search text.
nnoremap <Leader>/ :nohlsearch<CR>
"Useful as hell.
nnoremap ; :
"Quickly edit and source vimrc file.
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
"Quick mapping for mksession.
nnoremap <Leader>mks :mksession! session.vim<CR>

syntax on					"Enable syntax highlighting.
filetype on					"Enable filetype support.
filetype plugin indent on	"Enable filetype plugins.

if has("gui-running")
	set background=light
else
	set background=dark
endif
colorscheme lucius

