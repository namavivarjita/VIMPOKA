" POKA VIM CONFIG 

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" VUNDLE
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'othree/html5.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle '2072/PHP-Indenting-for-VIm'
" Stevelosh Badwolf
Bundle 'sjl/badwolf'


set history=200
set t_Co=256

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Map <leader> to <,>
let mapleader = ","
let g:mapleader = ","

" Don't move around in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Fast saving
nmap <leader>w :w!<cr>

" jj esc
imap jj <Esc>

" => VIM UX
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.ht\*,.svn\*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" Always show current position
"set ruler

" Highlight the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


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

" set relativenumbers
set nu 
set ttyfast
set cursorline

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
    set guitablabel=%M\ %t
endif


" => Colors
" Enable syntax highlighting
syntax enable
set background=dark
let g:badwolf_tabline = 2
let g:badwolf_html_link_underline = 0
colorscheme badwolf

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
set nowrap

" Movement
" Treat long lines as break lines (useful moving between them)
map j gj
map k gk

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======

nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v


" Move among windows
map <C-j> <C-W>j
map <C-k> <C-w>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Buffer cycle
map <silent> <leader><space> :bnext<cr>

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


"" Remember info about open buffers on close
"set viminfo^=%

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
"
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

" Steve Losh .vim
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set splitright

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
" From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
vnoremap u <nop>
vnoremap gu u

" Set the statusline color
hi StatusLine ctermbg=grey ctermfg=black
hi StatusLine guibg=grey guifg=black

