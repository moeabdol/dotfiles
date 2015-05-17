" Vundle Plugin Manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugin
Plugin 'gmarik/Vundle.vim'

" Status and Tab line plugin
Plugin 'bling/vim-airline'

" Directory tree plugins
Plugin 'scrooloose/nerdtree.git'
"Plugin 'jistr/vim-nerdtree-tabs'

" Comment plugin
Plugin 'scrooloose/nerdcommenter.git'

" Code tags plugin
Plugin 'majutsushi/tagbar'

" Delimiter completion plugin
Plugin 'Raimondi/delimitMate.git'

" Python autocompletion plugin
"Plugin 'davidhalter/jedi-vim.git'

" Java autocompletion plugin
Plugin 'vim-scripts/javacomplete'

" C and C++ autocompletion plugin
Plugin 'Rip-Rip/clang_complete'

" Close all buffers plugin
Plugin 'vim-scripts/BufOnly.vim'

" Autocompletion plugin
Plugin 'vim-scripts/AutoComplPop'

" Ruby and Ruby on Rails Plugins
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'

" Fuzzy file search plugin
Plugin 'kien/ctrlp.vim'

" Search code in project
Plugin 'mileszs/ack.vim'

" Syntax checking plugin
Plugin 'scrooloose/syntastic.git'

" Plugin for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Tmux and Vim navigation compatibility plugin
Plugin 'christoomey/vim-tmux-navigator'

" Git plugin
Plugin 'tpope/vim-fugitive'

" LaTex plugin
"Bundle 'LaTeX-Box-Team/LaTeX-Box.git'

" Multiple cursor plugin
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()

" Reload .vimrc Automatically when Saved
autocmd! bufwritepost .vimrc source %

" Set Filetype
filetype on
filetype plugin indent on

" Set shell
set shell=bash

" Set Working Directory to Current Working File Directory
"set autochdir

" Set Encoding
set encoding=utf-8
set fileencoding=utf-8

" Display incomplete commands
set showcmd

" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Add line above/below cursor line without entering insert mode
nmap g<C-o> o<ESC>k
nmap gO O<ESC>j

" Bind <Leader> Key
let mapleader=','
let maplocalleader='\\'

" Set Tab Spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Set indentation for ruby files
"autocmd FileType ruby setl sw=2 sts=2 et
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

" Set ruby compiler
autocmd FileType ruby compiler ruby

" Set indentation for html, css, yaml, sass, and scss files
autocmd FileType html set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType scss set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType scss set tabstop=2 shiftwidth=2 softtabstop=2

" Set folding
set foldmethod=indent
set foldnestmax=2
set foldlevel=99
nnoremap <space> za

" Bind Window (Split) Movements
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Bind buffer movements
nmap <s-l> :bn<CR>
nmap <s-h> :bp<CR>

" Enable switching of buffers without saving modified buffers
set hidden

" Visual Indentation
vnoremap < <gv
vnoremap > >gv

" Show Trailing White Spaces
" Must be Located Before Color Scheme Command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set Color Scheme
set t_Co=256
colorscheme wombat256mod
"colorscheme wombat256i

" Set Search Highlighting
set showmatch
set hlsearch
set incsearch
set ignorecase
set infercase
set smartindent
"set smartcase

" Remove Search Highlighting When Done
noremap <CR> :nohlsearch<CR>

" Set tab completion when selecting files/buffers
set wildmenu
set wildmode=full
"set wildignorecase

" Set Cursor Line Highlight
set cursorline

" Enable Mouse Support
set mouse=a

" Sort Lines Alphabetaclly
vnoremap <Leader>s :sort<CR>

" Enable Syntax Highlighting
syntax on

" Set Line and Text Properties
set number
set tw=79
set winwidth=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Fix Mac OSX Delete Problem
set backspace=indent,eol,start

" Set Vertical and Horizontal Splits
set splitright
set splitbelow

" Set omni-completion settings
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone
"set completeopt-=longest

" Close scratch/preview menu after omni-completion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Map JSON Pretty Printing
nnoremap <Leader>j :%!python -m json.tool<CR>

" Set HTML autocompletion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Clang_complete plugin
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_auto_select=1

" Jedi-vim Plugin
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#use_tabs_not_buffers = 1

" AutoComplPop plugin
let g:acp_enableAtStartup = 1
let g:acp_behaviorKeywordLength = 2
let g:AutoComplPop_IgnoreCaseOption=1
let g:AutoComplPop_CompleteoptPreview = 0

" NERD Commenter Plugin
" usage <Leader>ci

" Ctrlp Plugin
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden=1
nmap <Leader>r :CtrlPClearCache<CR>

" Ack
nmap <Leader>a :LAck! 

" Syntastic Plugin
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 10
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_exec = '/opt/local/bin/flake8-2.7'
let g:syntastic_python_flake8_args='--ignore=E113,E127,E128,E265,E301,E302,E501,E701,F401,F403,F841,W391'
let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_clang_exec = '/usr/bin/clang++'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

" NERDTree plugin
"autocmd VimEnter * :NERDTree | wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <silent><F1> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'
" move tabs to the end for new, single buffers (exclude splits)
"autocmd BufNew * execute ":tabmove99"
let NERDTreeIgnore = ['.pyc$[[file]]', '.git$[[dir]]']
let NERDTreeChDirMode=0
let g:NERDTreeWinSize=32

" NERDTree Tab plugin
" Makes NERDTree Tab Aware
"nnoremap <silent><F1> :NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_focus_on_files = 1
"let g:nerdtree_tabs_synchronize_view = 1
"let g:nerdtree_tabs_synchronize_focus = 1
"let g:nerdtree_tabs_meaningful_tab_names = 1
"let g:nerdtree_tabs_autofind = 1

" TagBar Plugin
nnoremap <silent><F2> :TagbarToggle<CR>
let g:tagbar_map_togglefold='<space>'
let g:tagbar_width = 32
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Vim-Tmux-Navigator Plugin
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Vim-Airline Plugin
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_theme = 'murmur'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_left_sep = ''
let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ''
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#right_sep = ''

" functin to toggle quick-fix and location list
function! GetBufferList()
    redir =>buflist
    silent! ls
    redir END
    return buflist
endfunction
function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx == 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo "Location List is Empty."
        return
    endif
    let winnr = winnr()
    exec(a:pfx.'open')
    if winnr() != winnr
        wincmd p
    endif
endfunction
nmap <silent><leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent><leader>q :call ToggleList("Quickfix List", 'c')<CR>

" LaTex-Box plugin
" you must install 'latexmk'and 'Skim' because the plugin depends on it
" for compilation and previewing
" For syncronous update to the Skim pdf reader go to Preferences->Sync and
" chose Custom preset. Add pvim in Command and --remote-tab-silent
" +":%line;foldo!" "%file" in Arguments
"let g:LatexBox_latexmk_options = "-pvc -pdfps"
"let g:LatexBox_Folding = 1
"let g:LatexBox_latexmk_preview_continuously = 1
"let g:LatexBox_quickfix = 2
"let g:LatexBox_autojump = 1
