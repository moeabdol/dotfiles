" protect against overwriting my .vimrc
if &compatible
  set nocompatible
endif

call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'chriskempson/base16-vim'

call plug#end()

filetype on
filetype plugin on
filetype indent on
syntax on

" force true color when using regular vim inside tmux as the colorscheme
" can appear to be grayscale with 'termguicolors' option enabled.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" set sane defaults
" set termguicolors
set encoding=utf8
set fileencoding=utf8
set showcmd
set showmode
set showmatch
set number
set nowrap
set breakindent
set showbreak=↳
set laststatus=2
set hidden
set ignorecase
set smartcase
set infercase
set textwidth=80
set winwidth=80
set colorcolumn=+1
set mouse=r
set list
set listchars=tab:\|\ 
set listchars+=nbsp:␣
set listchars+=trail:·
set listchars+=extends:▶
set listchars+=precedes:◀
set listchars+=eol:↲
set fillchars+=vert:│
set backspace=indent,eol,start
set clipboard=unnamedplus
set cursorline
set cursorcolumn
set splitright
set splitbelow
set timeout
set timeoutlen=200

" indentation
set shiftwidth=4
set noexpandtab
set tabstop=4
set softtabstop=4
set autoindent

" case insensitive search
set ignorecase
set smartcase
set infercase

" auto-completion
set wildmenu
set wildmode=list:longest

" fuzzy find
set path+=**

" lazy file name tab completion
set wildmenu
set wildignorecase
set wildmode=list,longest,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" search highlight
set hlsearch
set incsearch

" show trailing whitespaces
augroup show_trailing_whitespace
        autocmd!
        autocmd ColorScheme * highlight show_trailing_whitespace ctermbg=red guibg=red
        autocmd InsertLeave * match show_trailing_whitespace /\s\+$/
augroup END

" colorscheme (must be after `show_trailing_whitespace`)
set background=dark
colorscheme base16-default-dark

" leaderkey
let mapleader=","

" remove search highlighting when done
noremap <CR> :nohlsearch<CR>

" visual indentation
vnoremap < <gv
vnoremap > >gv

nnoremap <C-o> o

" autoreload changes
autocmd FocusLost,WinLeave * :silent! noautocmd w

" NERDTree
nnoremap <F1> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'
let NERDTreeIgnore = ['.pyc$[[file]]', '.swp$[[file]]', '.git$[[dir]]', '.sass-cache$[[dir]]', 'map$[[file]]']
let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif

" reload .vimrc
autocmd! bufwritepost .vimrc source %
