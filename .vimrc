" protect against programs overwriting my .vimrc
if &compatible
  set nocompatible
endif

" disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1


call plug#begin()
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'dense-analysis/ale'
    Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoInstallBinaries' }
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'godlygeek/tabular'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'preservim/vim-markdown', { 'for': 'markdown' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': 'markdown' }
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/emmet-vim'
    Plug 'sheerun/vim-polyglot'
	Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact'] }
	Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
    Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-surround'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/tagbar'
call plug#end()

syntax on
filetype plugin indent on

" force true color when using regular vim inside tmux as the colorscheme
" can appear to be grayscale with 'termguicolors' option enabled.
if (has("termguicolors"))
	let &t_8f ="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b ="\<Esc>[48;2;%lu;%lu;%lum"
    set t_Co=256
	set termguicolors
endif

set rtp+=~/repos/fzf

" colorscheme
let g:tokyonight_style='night'
let g:tokyonight_enable_italic=0
let g:tokyonight_disable_italic_comment=1
colorscheme tokyonight
set background=dark

" set sane defaults
set encoding=utf8
set fileencoding=utf8
set showcmd
set noshowmode
set showmatch
set relativenumber
set number
set autoindent
set copyindent
set breakindent
set nowrap
set showbreak=↳
set laststatus=2
set hidden
set ignorecase
set smartcase
set infercase
set textwidth=80
set winwidth=80
set ruler
set colorcolumn=+1
set mouse=a
" set list
" set listchars=tab:\·\ ,nbsp:␣
" set listchars+=trail:·
" set listchars+=extends:▶
" set listchars+=precedes:◀
" set listchars+=eol:↲
" set fillchars=vert:│
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cursorline
set nocursorcolumn
set splitright
set splitbelow
set notimeout
" set timeout
" set timeoutlen=100
" set nottimeout
set ttimeout
set ttimeoutlen=100
set updatetime=100
set shortmess+=c
set belloff+=ctrlg
set autoread
set hlsearch
set incsearch
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set conceallevel=3
set tags=./tags;~
set noexpandtab

" faster vim
set noswapfile
set lazyredraw

" auto-completion
set complete+=kspell
" set completeopt-=noselect
" set completeopt-=noinsert
" set completeopt-=preview
" set completeopt-=popup
set completeopt+=menuone,popup,preview,noselect,noinsert

" fuzzy find files
set path+=**

" command completion
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set wildignorecase

" ignore files
set wildignore=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg

" omni completion
set omnifunc=syntaxcomplete#Complete
imap <c-x><c-o> <Plug>(ale_complete)
" set omnifunc=ale#syntaxcomplete#Complete

" language-specific
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType vim,go,c,cpp setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType python,py setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType json setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript,typescript,typescriptreact,css,sass,scss,html setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType sql setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType make setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType help wincmd L

" leaderkey
let mapleader      =','
let maplocalleader =','

" center navigation
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" add lines above/below
nnoremap <leader>o o<esc>k$
nnoremap <leader>O O<esc>j$

" remove search highlighting when done
noremap <CR> :nohlsearch<CR>

" indentation keymaps
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" quickfix
nnoremap [q <Plug>(ale_previous)
nnoremap ]q <Plug>(ale_next)

autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif " QuickFix 100% width

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <F2> :call ToggleQuickFix()<cr>

function! QuickfixMapping()
	" Go to the previous location and stay in the quickfix window
	nnoremap <buffer> K :cprev<CR>zz<C-w>w
	" Go to the next location and stay in the quickfix window
	nnoremap <buffer> J :cnext<CR>zz<C-w>w
	" Make the quickfix list modifiable
	nnoremap <buffer> <leader>u :set modifiable<CR>
	" Save the changes in the quickfix window
	nnoremap <buffer> <leader>w :cgetbuffer<CR>:cclose<CR>:copen<CR>
	" Begin the search and replace
	nnoremap <buffer> <leader>r :cdo s/// \| update<C-Left><C-Left><Left><Left><Left>
endfunction

augroup quickfix_group
	autocmd!
	" Use custom keybindings
	autocmd filetype qf call QuickfixMapping()
	" Add the errorformat to be able to update the quickfix list
	autocmd filetype qf setlocal errorformat+=%f\|%l\ col\ %c\|%m
augroup END

" nerdtree
nnoremap <F1> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit='<C-s>'
let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapActivateNode='<space>'
let g:NERDTreeIgnore = ['.pyc$[[file]]', '.swp$[[file]]', '.git$[[dir]]', '.sass-cache$[[dir]]', 'map$[[file]]']
let g:NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif

" nerd commenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters = {
\	'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/* ', 'rightAlt': ' */}' },
\	'javascriptreact': { 'left': '//', 'right': '', 'leftAlt': '{/* ', 'rightAlt': ' */}' },
\	'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/* ', 'rightAlt': ' */}' },
\	'typescriptreact': { 'left': '//', 'right': '', 'leftAlt': '{/* ', 'rightAlt': ' */}' },
\	}

" vim markdown
let g:vim_markdown_folding_disabled = 1

" ale
let g:ale_completion_enabled=0
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
let g:ale_open_list=0
let g:ale_keep_list_window_open=0
let g:ale_sign_error=''
let g:ale_sign_warning=''
let g:ale_sign_info=''
let g:ale_lint_on_text_changed='normal'
let g:ale_fix_on_save=1
let g:ale_lint_delay=100
let g:ale_completion_delay=100
let g:ale_virtualtext_cursor='disabled'
let g:ale_go_golangci_lint_executable='/home/moeabdol/go/bin/golangci-lint'
let g:ale_go_golangci_lint_package=1
let g:ale_linters = {
\	'python': ['pyright', 'flake8', 'pylint', 'bandit'],
\	'javascript': ['eslint'],
\	'typecript': ['eslint', 'tslint'],
\	'typecriptreact': ['eslint', 'tslint'],
\	'go': ['gofmt', 'golint', 'gosimple', 'staticcheck', 'revive', 'gopls', 'govet', 'gotype', 'golangci-lint'],
\ }
let g:ale_fixers = {
\	'javascript': ['prettier', 'eslint'],
\	'typescript': ['prettier', 'eslint'],
\	'typecriptreact': ['prettier', 'eslint'],
\   'go': ['gofmt', 'goimports', 'gopls']
\ }

" gitgutter
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = 'ﰣ'
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_removed_above_and_below = '-'
let g:gitgutter_sign_modified_removed = '~-'

" fzf
let g:fzf_layout = { 'down': '40%' }
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><C-x><C-p> :Rg<CR>
nnoremap <silent><Leader>t :Tags<CR>
nnoremap <silent><Leader>g :GFiles<CR>
nnoremap <silent><Leader>s :GFiles!?<CR>
nnoremap <silent><Leader>b :Buffers<CR>

let g:fzf_action = {
    \	'tab': 'tab split',
    \	'ctrl-s': 'split',
    \	'ctrl-v': 'vsplit' }

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --hidden --color=always --smart-case %s --glob=!.dropbox/* --glob=!.dropbox-dist/* --glob=!.nvm/* --glob=!.npm/* --glob=!node_modules/* --glob=!.venv/* || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    let options = fzf#vim#with_preview(options, 'right:50%', 'ctrl-/')
    call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" hexkinase
let g:Hexokinase_highlighters = ['backgroundfull']
nnoremap <silent><leader>hx :HexokinaseToggle<CR>

" lightline
let g:lightline = {
    \	'colorscheme': 'tokyonight',
    \	'active': {
    \	  'left': [
    \           ['mode', 'paste'],
    \           [ 'gitbranch', 'readonly', 'filename' ,'modified']
    \       ]
    \	},
    \	'component_function': {
    \		'gitbranch': 'GitBranch',
    \       'filename': 'LightlineTruncatedFileName',
    \		'filetype': 'LightlineFiletype',
    \		'fileformat': 'LightlineFileformat',
    \	},
    \   'component': {
    \       'branch_icon': ''
    \   }
    \ }

function! GitBranch()
    let l:branch = gitbranch#name()
    if branch ==# ''
        return ''
    else
        return ' ' . branch
    endif
endfunction

function! LightlineTruncatedFileName()
    let l:filePath = expand('%')
    if winwidth(0) > 70
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() . ' ' : 'no ft') : ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol() . ' ') : ''
endfunction

" vim markdown
let g:mkdp_auto_start = 1

"vim indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=#232433
hi IndentGuidesEven guibg=#2a2b3d

" ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" vim-go
let g:go_fmt_fail_silently = 1
" let g:go_metalinter_enabled = 1
" let g:go_metalinter_command = "golangci-lint"
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['errcheck', 'staticcheck', 'gosimple', 'govet', 'ineffassign', 'typecheck', 'unused', 'revive']

" vim-emmet
let g:user_emmet_leader_key=','

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" autoreload changes
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" ctags
autocmd BufWritePost *.c,*.cpp,*.h,*.js,*.ts,*.tsx,*.py,*.go silent! execute "!ctags --options=/home/moeabdol/.config/ctags/.ctags . >/dev/null 2>&1" | redraw

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
	\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" reload .vimrc
autocmd! BufWritePost ~/.vimrc source %
