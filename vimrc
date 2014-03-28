" POKA VIM CONFIG 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" VUNDLE packages start >>
Bundle 'gmarik/vundle'
Bundle 'othree/html5.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle '2072/PHP-Indenting-for-VIm'
"Bundle 'sjl/badwolf'
Bundle 'hickop/vim-hickop-colors'
Bundle 'kien/ctrlp.vim'
" VUNDLE packages end <<

" VIM basic config >>
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set history=50
set t_Co=256
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.ht\*,.svn\*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set splitbelow
set splitright
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set showmatch
set nu 
set ttyfast
set cursorline
" Use spaces no tabs
set expandtab
" Smart tab
set smarttab
" One tab == 2 spaces
set shiftwidth=2
set tabstop=2
" Linebreak on 500 char
set lbr
set tw=500
set ai
set si
set nowrap
" Set to auto read when a file is changed from the outside
set autoread
"" Remember info about open buffers on close
"set viminfo^=%
" Statusline
" Always show the status line
set laststatus=2
" Status line makeup
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" From blog.sancturm.geek.nz
" No start up mesg
set shortmess+=I
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
set wildmenu
" VIM basic config <<

" VIM UX >>
filetype plugin on
filetype indent on
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
endif
" Highlight the 81st column of wide lines...
highlight ColorColumn ctermbg=white
call matchadd('ColorColumn', '\%81v', 100)
syntax enable
set background=dark
"let g:badwolf_tabline = 2
"let g:badwolf_html_link_underline = 0
"colorscheme badwolf
colorscheme hickop

" Key Mappings >>

let mapleader = ","
let g:mapleader = ","
nnoremap <up> :echoe "Use k"<cr> 
nnoremap <down> :echoe "Use j"<cr> 
nnoremap <left> :echoe "Use h"<cr> 
nnoremap <right> :echoe "Use l"<cr> 
" Fast saving
nmap <leader>w :w!<cr>
" jj esc
imap jj <Esc>
" Treat long lines as break lines (useful moving between them)
map j gj
map k gk

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


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Disable unneeded keys
" No more F1 for help :help
nnoremap <F1> <nop>

" No ex mode on Q
nnoremap Q <nop>

" K not starts man page
nnoremap K <nop>

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

" Switch between the last two files
nnoremap <leader><leader> <c-^>
