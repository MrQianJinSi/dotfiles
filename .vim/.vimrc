set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

Plugin 'valloric/youcompleteme' "should be compiled to install
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


" Plugin 'rdnetto/ycm-generator'
" Plugin 'jeaye/color_coded' "should be compiled to install

"Syntax check for python, Ycm only check C-family language
Plugin 'w0rp/ale'
"Plugin 'vim-syntastic/syntastic'

" python coding style check
" Plugin 'nvie/vim-flake8'
"
Plugin 'ctrlpvim/ctrlp.vim'
"auto save
Plugin '907th/vim-auto-save'



" All of your Plugins must be added before the following line
call vundle#end()            " required
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
" tab colors
":hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
":hi TabLine ctermfg=Blue ctermbg=Yellow
":hi TabLineSel ctermfg=Red ctermbg=Yellow
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
"nnoremap <C-j> <C-w>j 
"nnoremap <C-k> <C-w>k 
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" jump between buffers
" nnoremap <silent> [b :bprevious<CR>
" nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> [B :bfirst<CR>
" nnoremap <silent> ]B :blast<CR>
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>bn :enew<cr>

" Move between buffers
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>H :bfirst<CR>
nnoremap <leader>L :blast<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>q :bp <BAR> bd #<CR>

" convert tab to spaces
" by default, the indent is 2 spaces
set shiftwidth=2 " this controlls how many spaces will be used with autoindent
set expandtab   " make Vim to insert with spaces instead of tabs
set tabstop=2 " set number of spaces to be used
set softtabstop=2 " delete how many spaces when stroke backspace 
" set tab width for different filetype
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
" don't convert tab when edit Makefile
autocmd FileType make setlocal noexpandtab

" disable markdown hightlight
autocmd BufRead,BufNewFile {*.markdown,*.mdown,*.mkdn,*.md,*.mkd,*.mdwn,*.mdtxt,*.mdtext,*.text} set filetype=markdown
autocmd FileType markdown setlocal syntax=off

" stop hide quote in json
set conceallevel=0

" diable vim auto insert line break
" this enables "visual" wrapping
set wrap
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

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
" nmap <F5> :NERDTreeToggle<CR>
" Sibling keybinds conflict with vim split
let g:NERDTreeMapJumpPrevSibling = '<C-p>'
let g:NERDTreeMapJumpNextSibling = '<C-n>'

" NERD Tree tabs
nmap <F5> :NERDTreeTabsToggle<CR>

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
" airline handle ale
let g:airline#extensions#ale#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" YouCompleteMe
" set fallback ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" open location list
let g:ycm_always_populate_location_list = 1
" Don't ask when starting vim
let g:ycm_confirm_extra_conf = 0
" set warning sign
let g:ycm_warning_symbol = '**'
" auto close preview window after completion
" let g:ycm_autoclose_preview_window_after_completion = 1
" auto close preview window when leaves insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1
" auto completion for language keywords
let g:ycm_seed_identifiers_with_syntax = 1
" add python3 completion
let g:ycm_python_binary_path = '/usr/bin/python3'
" set server interpreter
" let g:ycm_server_python_interpreter = ''
" auto insert completion
" let g:ycm_key_invoke_completion = ''

"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_server_use_vim_stdout = 0
" DEBUG
"let g:ycm_keep_logfiles = 1
"let g:ycm_log_level = 'debug'
" Set keyboard shortcut
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <F2> :YcmCompleter GetDoc<CR>
nmap <F8> :YcmDiags<CR>

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
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|[dD]ata|.*\_py[23])$',
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
