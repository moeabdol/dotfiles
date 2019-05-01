set nocompatible
filetype off

" Vundle Plugin Manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'szw/vim-tags'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'suan/vim-instant-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'moll/vim-node'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'gko/vim-coloresque'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Plugin 'fatih/vim-go'
" Plugin 'StanAngeloff/php.vim'
" Plugin 'jwalton512/vim-blade'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'tpope/vim-rails'
" Plugin 'keith/rspec.vim'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'scrooloose/syntastic'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'vim-scripts/javacomplete'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'qpkorr/vim-bufkill'
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

" Autocomplete with dictionary words when spell check is on
 set complete+=kspell

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
set foldmethod=indent
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

" Buffer movements
" nmap <s-l> :bn<CR>
" nmap <s-h> :bp<CR>

" Visual Indentation
vnoremap < <gv
vnoremap > >gv

" Show Trailing White Spaces
" Must be Located Before Color Scheme Command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set GUI Color Scheme
syntax on
" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colorscheme wombat
" set cursorline

" Or
" Set 256 Terminal Color Scheme
set t_Co=256
colorscheme wombat
set cursorline

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
syntax enable

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

" Don't show mode since I configure it in statusline
set noshowmode

" Show colorcolumn only in active window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=80
  autocmd WinLeave * set colorcolumn=0
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Map JSON Pretty Printing
nnoremap <Leader>j :%!python -m json.tool<CR>

" Set HTML autocompletion
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Set indentation for file types
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4

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

" Clang_complete plugin
"let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=1
"let g:clang_auto_select=1

" Jedi-vim Plugin
"let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#show_call_signatures = 0
" autocmd FileType python setlocal completeopt-=preview

" Vim Tags
let g:vim_tags_ignore_files=[]
let g:vim_tags_auto_generate=1
set tags=./tags;/
let g:vim_tags_directories=[]

" AutoComplPop plugin
let g:acp_enableAtStartup=1
let g:acp_behaviorKeywordLength=2
let g:acp_ignorecaseOption=1

" Map ctrl-x ctrl-o to ctrl-space
inoremap <C-@> <C-x><C-o>

" tsuquyomi plugin
" let g:tsuquyomi_disable_quickfix = 1

" Ctrlp Plugin
"let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden=1
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
" function! SetupCtrlP()
"   if exists("g:loaded_ctrlp") && g:loaded_ctrlp
"     augroup CtrlPExtension
"       autocmd!
"       autocmd FocusGained  * CtrlPClearCache
"       autocmd BufWritePost * CtrlPClearCache
"     augroup END
"   endif
" endfunction
" if has("autocmd")
"   autocmd VimEnter * :call SetupCtrlP()
" endif

" Bufkill
" map <C-c> :bd<cr>

" Ack
nmap <Leader>a :LAck!

" Javascript
let g:used_javascript_libs = 'angularjs, jasmine, angularuirouter'

" Vim-JSX
let g:jsx_ext_required = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/snippets/', '~/.vim/bundle/vim-snippets/UltiSnips/']
let g:UltiSnipsEditSplit="vertical"

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"ALE configuration
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0

" ALE linting events
" let g:ale_lint_on_text_changed = 0
" autocmd CursorHold * call ale#Lint()
" autocmd CursorHoldI * call ale#Lint()
" autocmd InsertEnter * call ale#Lint()
" autocmd InsertLeave * call ale#Lint()
let g:ale_pattern_options = {
\   '.*\.html$': {'ale_enabled': 0},
\}

let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck']
\}

" Move between linting errors
" nnoremap ]r :ALENextWrap<CR>:cnext<CR>
" nnoremap [r :ALEPreviousWrap<CR>:cprev<CR>
nmap <silent> ]r <Plug>(ale_next_wrap)
nmap <silent> [r <Plug>(ale_previous_wrap)

" Syntastic Plugin
" let g:syntastic_check_on_open = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_swift_checkers = ['swiftlint']
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_exec = '/usr/local/bin/flake8'
" let g:syntastic_python_flake8_args='--ignore=E111,E113,E127,E128,E203,E221,E222,E231,E241,E265,E301,E302,E401,E501,E701,F401,F403,F841,W391'
" let g:syntastic_scss_checkers=['']
" let g:syntastic_html_checkers=['']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_clang_exec = '/usr/bin/clang++'
" let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol = ">>"
" let g:syntastic_warning_symbol = ">>"
" let g:syntastic_style_error_symbol = ">>"
" let g:syntastic_style_warning_symbol = ">>"
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"
" let g:syntastic_style_error_symbol = "✗"
" let g:syntastic_style_warning_symbol = "⚠"
" let g:syntastic_html_tidy_ignore_errors = [
"     \  '> proprietary attribute "',
"     \  '> attribute "lang" lacks value',
"     \  '> attribute "href" lacks value',
"     \  'trimming empty <'
"     \ ]

" NERDTree plugin
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <silent><F1> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'
let NERDTreeIgnore = ['.pyc$[[file]]', '.swp$[[file]]', '.git$[[dir]]', '.sass-cache$[[dir]]', 'map$[[file]]']
let NERDTreeChDirMode=2
" let g:NERDTreeWinSize=36
let NERDTreeShowHidden=1

" Vim-Tmux-Navigator Plugin
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

set laststatus=2

" Vim-Airline Plugin
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" Vim devicons settings
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

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

" Function to Watch for changes if buffer changed on disk
function! WatchForChanges(bufname, ...)
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  let msg = "\n"
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)
