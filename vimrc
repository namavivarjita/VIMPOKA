"My VIM 

" =>
" Sets how many lines of history VIM has to remember
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" VUNDLE
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'othree/html5.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle '2072/PHP-Indenting-for-VIm'

set history=200
set t_Co=256
set bg=dark

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Map <leader> to <,>
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" jj esc
imap jj <Esc>

" :W sudo saves the file
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null
" => VIM UX
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.ht\*,.svn\*

" Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Fix the backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Case insensetive searching
set ignorecase

" Smart cases search
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" No annoying beeps
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remove the gui
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set t_Co=256
    set guitablabel=%M\ %t
endif

" A bit of left margin
"set foldcolumn=1

" => Colors
" Enable syntax highlighting
syntax enable
colorscheme solarized 

" Set encoding 
set encoding=utf8

" Unix file type
set ffs=unix,dos,mac

" => Files, backups and undo
" Turn backup off
set nobackup
set nowb
set noswapfile

" => Text, Tab and Indent
"
" Use spaces no tabs
set expandtab

" Smart tab
set smarttab

" One tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 char
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Movement
" Treat long lines as break lines (useful moving between them)
map j gj
map k gk

" Map <Space> to / (search) Ctrl-<Space> to ? (backward search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Move among windows
map <C-j> <C-W>j
map <C-k> <C-w>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Buffer cycle
map <leader>n :bnext<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Tabbing Tabbing
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path 
" Super useful when editing files in the same dir
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g~\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

" Statusline
" Always show the status line
set laststatus=2

" Status line makeup
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
     if &paste
         return 'PASTE MODE  '
     en
     return ''
endfunction

" Misc
" Quickly open a buffer
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" => Plugins
" Nerdtree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" From blog.sancturm.geek.nz
" No start up mesg
set shortmess+=I

" Disable unneeded keys
" No more F1 for help :help
nnoremap <F1> <nop>

" No ex mode on Q
nnoremap Q <nop>

" K not starts man page
nnoremap K <nop>


