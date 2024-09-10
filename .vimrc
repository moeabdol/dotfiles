" protect against programs overwriting my .vimrc
if &compatible
  set nocompatible
endif

" disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

call plug#begin()
	Plug 'airblade/vim-gitgutter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'dense-analysis/ale'
	Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoInstallBinaries' }
    Plug 'ghifarit53/tokyonight-vim'
	Plug 'godlygeek/tabular'
    Plug 'honza/vim-snippets'
	Plug 'itchyny/lightline.vim'
	Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf.vim'
	Plug 'mattn/emmet-vim'
    Plug 'nathanaelkane/vim-indent-guides'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'sheerun/vim-polyglot'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
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

set rtp+=~/.fzf

" colorscheme
let g:tokyonight_style='night'
let g:tokyonight_enable_italic=0
let g:tokyonight_disable_italic_comment=1
colorscheme tokyonight
set background=dark

" set sane defaults
set encoding=utf8
set nobackup
set nowritebackup
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
set nofoldenable
set foldmethod=indent
set foldlevel=2
" set foldlevelstart=0
set foldnestmax=10
set conceallevel=0
set tags=./tags;~
set noexpandtab
" set signcolumn=yes
set nrformats=

" faster vim
set noswapfile
" set lazyredraw

" auto-completion
set complete+=kspell
set completeopt+=menu,menuone,popup,preview,noinsert,noselect

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

" language-specific
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType vim,go,c,cpp setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType python,py setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType sh,bash setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType json,jsonc setlocal shiftwidth=4 tabstop=4 noexpandtab
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
noremap <space> :nohlsearch<CR>

" indentation keymaps
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" grep
if executable('rg')
	set grepprg=rg\ --vimgrep\ --hidden\ --no-heading\ --smart-case
	set grepformat=%f:%l:%c:%m
endif

" quickfix
autocmd FileType QuickFix if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif " QuickFix 100% width

" nerdtree
nnoremap <leader><space> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
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

" ale
nnoremap [q <Plug>(ale_previous)
nnoremap ]q <Plug>(ale_next)
" noremap gd :ALEGoToDefinition<CR>
let g:ale_completion_enabled=0
let g:ale_set_loclist=0
let g:ale_set_quickfix=0
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
\	'javascriptreact': ['eslint'],
\	'typescript': ['eslint', 'tsserver'],
\	'typescriptreact': ['eslint', 'tsserver'],
\	'html': ['eslint'],
\	'go': ['gofmt', 'golint', 'gosimple', 'staticcheck', 'gopls', 'govet', 'gotype', 'golangci-lint'],
\	'sh': ['shellcheck'],
\	'bash': ['shellcheck'],
\	'css': ['stylelint'],
\	'scss': ['stylelint'],
\	'sass': ['stylelint'],
\ }
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\	'typescript': ['prettier'],
\	'javascriptreact': ['prettier'],
\	'typescriptreact': ['prettier'],
\   'json': ['prettier'],
\   'jsonc': ['prettier'],
\	'css': ['prettier'],
\   'scss': ['prettier'],
\   'sass': ['prettier'],
\   'html': ['prettier'],
\   'xml': ['prettier'],
\   'go': ['gofmt', 'goimports', 'gopls']
\ }

" CoC
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Scrolling doc floating window
function FindCursorPopUp()
	let radius = get(a:000, 0, 2)
	let srow = screenrow()
	let scol = screencol()
	" it's necessary to test entire rect, as some popup might be quite small
	for r in range(srow - radius, srow + radius)
		for c in range(scol - radius, scol + radius)
			let winid = popup_locate(r, c)
			if winid != 0
				return winid
			endif
		endfor
	endfor
	return 0
endfunction

function ScrollPopUp(down)
	let winid = FindCursorPopUp()
	if winid == 0
		return 0
	endif
	let pp = popup_getpos(winid)
	call popup_setoptions( winid, {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } )
	return 1
endfunction

nnoremap <expr> <down> ScrollPopUp(1) ? '<esc>' : '<down>'
nnoremap <expr> <up> ScrollPopUp(0) ? '<esc>' : '<up>'

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-󱦲'
let g:gitgutter_sign_removed_above_and_below = '-󰹺'
let g:gitgutter_sign_modified_removed = '~-'

" fzf
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right,50%', 'ctrl-/']
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><C-x><C-p> :Rg<CR>
nnoremap <silent><Leader>t :Tags<CR>
" nnoremap <silent><Leader>g :GFiles<CR>
nnoremap <silent><Leader>g :GFiles!?<CR>
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

" tokyonight
let g:tokyonight_menu_selection_background='blue'
let g:tokyonight_cursor='blue'

" lightline
let g:lightline = {
	\	'colorscheme': 'tokyonight',
	\	'active': {
	\	  'left': [
	\           ['mode', 'paste'],
	\           ['gitbranch', 'readonly', 'filename' ,'modified']
	\       ]
	\	},
	\	'component_function': {
	\	'gitbranch': 'MyFugitiveHead',
	\       'filename': 'LightlineTruncatedFileName',
	\	}
	\ }

function MyFugitiveHead()
	let head = FugitiveHead()
	if head != ""
		let head = " " .. head
	endif
	return head
endfunction

function! LightlineTruncatedFileName()
    let l:filePath = expand('%')
    if winwidth(0) > 70
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction

"vim indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=#232433
hi IndentGuidesEven guibg=#2a2b3d

" ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsListSnippets="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" vim-go
let g:go_fmt_fail_silently = 1
let g:go_doc_balloon = 0
let g:go_doc_popup_window = 0
let g:go_metalinter_enabled = ['all']
let g:go_def_mapping_enabled = 0

" vim-emmet
let g:user_emmet_leader_key='<c-y>'
let g:emmet_html5=1

" autoreload changes
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" ctags
autocmd BufWritePost *.c,*.cpp,*.h,*.js,*.jsx,*.ts,*.tsx,*.py,*.go silent! execute "!ctags --options=/home/moeabdol/.config/ctags/.ctags . >/dev/null 2>&1" | redraw

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" reload .vimrc
autocmd! BufWritePost ~/.vimrc source %
