set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'chrisbra/NrrwRgn'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" deoplete plugins
" C Family
Plug 'zchee/deoplete-clang'
" python
" deps: pip install jedi
Plug 'zchee/deoplete-jedi', { 'do': 'pip install jedi' }
" javascript
" deps: npm install -g tern
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" flow type
" deps: npm install -g flow-bin
Plug 'wokalski/autocomplete-flow', { 'do': 'npm install -g flow-bin' } 
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" javascript syntax highlight
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'

" linters
" deps : npm install -g eslint
Plug 'w0rp/ale'


" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" VIM SELF SETTINGS 
" show line numbers
set number
set numberwidth=5
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
" Display extra whitespace
set list listchars=tab:»·,trail:·
" Set search display style
set matchpairs+=<:>
set hlsearch " highlight search result
" Display incomplete commands
set showcmd

" Map leader to <Space>
map <SPACE> <leader>
" Backspace deletes like most programs in insert mode
set backspace=2
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5
" Using System Clipboard
"nmap <leader>p "+p
"nmap <leader>y "+y

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" convert tab to spaces
" by default, the indent is 2 spaces
set shiftwidth=2 " this controlls how many spaces will be used with autoindent
set expandtab   " make Vim to insert with spaces instead of tabs
set tabstop=2 " set number of spaces to be used
set softtabstop=2 " delete how many spaces when stroke backspace 
" set tab width for different filetype
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
"autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
" don't convert tab when edit Makefile
autocmd FileType make setlocal noexpandtab

" disable markdown hightlight
autocmd BufRead,BufNewFile {*.markdown,*.mdown,*.mkdn,*.md,*.mkd,*.mdwn,*.mdtxt,*.mdtext,*.text} set filetype=markdown
autocmd FileType markdown setlocal syntax=off


" PLUGIN SETTINGS
" ColorScheme
"set t_Co=256 " should be set in .bashrc
syntax enable
colorscheme monokai
"let g:molokai_original = 1 " use molokai backgound color
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" indentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 2
set list lcs=tab:\|\ 
" airline
set laststatus=2 "Always display the status line

" vim-javascript
" Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" vim-jsx
" Enbale jsx highlighting for both js and jsx
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1
" neosnippet
let g:neosnippet#enable_completed_snippet = 1


" UltiSnips  
" fix Ycm conflicts with ultisnips
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" sphinx doc style
let g:ultisnips_python_style = 'sphinx'
" snips search path
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" vim-snippts
let g:snips_email = "wangshuang@wangshuang.co"
let g:snips_author = "wangshuang"
let g:snips_github = "https://github.com/mrqianjinsi"

" ale
let g:ale_linters = {
      \ 'sh': ['shellcheck'],
      \ 'json': ['jsonlint'],
      \ 'python': ['pylint'],
      \ 'javascript': ['eslint'],
      \}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_python_pylint_executable = 'python3 -m pylint'   " or 'python' for Python 2
" let g:ale_python_pylint_options = '--rcfile /home/wangshuang/memect/AnnouncementMiner/.pylintrc'

" ignore some warnings
" let g:ale_python_flake8_options = '--ignore=E501'


" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|[dD]ata|.*\_py[23]|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


" vim auto save
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "CursorHoldI"]
