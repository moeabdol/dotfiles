set nocompatible
filetype off

" Vundle Plugin Manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'szw/vim-tags'
Plugin 'dense-analysis/ale'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'gko/vim-coloresque'
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'fatih/vim-go'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'tpope/vim-endwise'
"Plugin 'terryma/vim-multiple-cursors'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'godlygeek/tabular'
" Plugin 'nvie/vim-flake8'
Plugin 'tomlion/vim-solidity'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'vim-scripts/javacomplete'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'LaTeX-Box-Team/LaTeX-Box.git'
call vundle#end()

" Reload .vimrc Automatically when Saved
autocmd! bufwritepost .vimrc source %

" Set Filetype
filetype plugin indent on

" Set Encoding
set encoding=utf8
set fileencoding=utf8

" Display incomplete commands
set showcmd

set laststatus=2

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

" Set folding
set foldmethod=syntax
set foldnestmax=2
set foldlevel=99
nnoremap <space> za
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Bind Window (Split) Movements
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Visual Indentation
vnoremap < <gv
vnoremap > >gv

" Show Trailing White Spaces
" Must be Located Before Color Scheme Command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set 256 Terminal Color Scheme
set t_Co=256
colorscheme wombat
set cursorline
set background=dark

" Set Search Highlighting
set showmatch
set hlsearch
set incsearch
set ignorecase
set infercase
set smartindent

" Remove Search Highlighting When Done
noremap <CR> :nohlsearch<CR>

" Set tab completion when selecting files/buffers
set wildmenu
set wildmode=full

" Enable mouse support
set mouse=a

" Enable Syntax Highlighting
syntax on
"syntax enable

" Set Line and Text Properties
set number
set textwidth=80
set winwidth=80
set nowrap
set colorcolumn=+1
highlight colorcolumn ctermbg=236 guibg=#303030

" Fix Mac OSX Delete Problem
set backspace=indent,eol,start

" Set Vertical and Horizontal Splits
set splitright
set splitbelow

" Set omni-completion settings
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest,menuone
set completeopt-=preview

" Close scratch/preview menu after omni-completion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Show colorcolumn only in active window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=80
  autocmd WinLeave * set colorcolumn=0
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Set indentation for file types
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType solidity setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab


" Remove scrollbars in macvim
set guioptions=

" Set vim-prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#config_precedence = 'prefer-file'

" Set vim-indent-guides plugin
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd ctermbg=236 guibg=#3A3A3A
hi IndentGuidesEven ctermbg=238 guibg=#4E4E4E
let g:indent_guides_exclude_filetypes = ['nerdtree']

" AutoComplPop plugin
"let g:acp_enableAtStartup=1
"let g:acp_behaviorKeywordLength=2
"let g:acp_ignorecaseOption=1

" Autocomplete with dictionary words when spell check is on
"set complete+=kspell

" FZF
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_tags_command = 'ctags -R'
nnoremap <C-p> :FZF<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>t :Tags<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Vim-JSX
let g:jsx_ext_required = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/snippets/', '~/.vim/bundle/vim-snippets/UltiSnips/']
let g:UltiSnipsEditSplit="vertical"

"ALE configuration
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_javascript_eslint_executable = 'eslint'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 0
let g:ale_pattern_options = {
\   '.*\.html$': {'ale_enabled': 0},
\}
let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck'],
\   'javascript': ['eslint'],
\   'python': ['pylint']
\}
"let g:ale_fixers = {
"\   'javascript': ['eslint']
"\}

" Move between linting errors
nmap <silent> ]r <Plug>(ale_next_wrap)
nmap <silent> [r <Plug>(ale_previous_wrap)

" NERDTree plugin
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <silent><F1> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'
let NERDTreeIgnore = ['.pyc$[[file]]', '.swp$[[file]]', '.git$[[dir]]', '.sass-cache$[[dir]]', 'map$[[file]]']
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1

" Vim-Tmux-Navigator Plugin
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Nerd Commenter
let g:NERDCustomDelimiters= {
	\ 'javascript.jsx': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

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

" Statusline
hi StatusLine ctermfg=White ctermbg=236
set laststatus=2
set statusline=%<%{FugitiveStatusline()}\ %f\ %h%m%r%=%y\ %-10.(%l,%c%V%)\ %p%%

set showtabline=0
