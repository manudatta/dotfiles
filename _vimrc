set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
let s:running_windows = has("win16") || has("win32") || has("win64")
if s:running_windows
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim
  call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
  set rtp+=~/.vim/bundle/Vundle.vim
  set rtp+=/usr/local/opt/fzf
  call vundle#begin()
end
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'koirand/tokyo-metro.vim'
Plugin 'BrainDeath0/Hypsteria'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-surround' 
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim' 
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-eunuch'
Plugin 'w0rp/ale'
Plugin 'jpalardy/vim-slime'
Plugin 'vimwiki/vimwiki'
Plugin 'jimenezrick/vimerl'
Plugin 'edkolev/erlang-motions.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'myusuf3/numbers.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/slimv.vim'
Plugin 'eternnoir/Conque-Shell'
Plugin 'majutsushi/tagbar'
Plugin 'aserebryakov/vim-todo-lists'
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
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


" Modeline and Notes
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)


" Startup
" map the leader to space
" make sure leader doesn't timeout like other keys
    map <Space> <Leader>
    nnoremap <silent> <Leader> :<C-U>set timeoutlen=99999 ttimeoutlen=99999<CR>:call feedkeys('<Leader>')<CR>
    " Reset timeoutline to normal soon afterwards
    autocmd CursorMoved * set timeoutlen=2000 ttimeoutlen=0
    let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")
    let g:erlangHighlightBif = 1
    let g:erlangHighLightOperators = 1

" Basics
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set fenc=utf-8 " UTF-8
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    let g:skip_loading_mswin=1 " Just in case :)

" Newish
    set history=9999 " big old history
    set timeoutlen=300 " super low delay (works for me)
    set formatoptions+=n " Recognize numbered lists
    set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
    set viminfo+=! " Store upper-case registers in viminfo
    set nomore " Short nomore

" General
    filetype plugin indent on " load filetype plugins/indent settings
    "set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set clipboard+=unnamed " share windows clipboard
    if s:running_windows
        set backupdir=~/vimfiles/backup " where to put backup files
        set directory=~/vimfiles/temp " directory to place swap files in
    else
        set backupdir=~/.vim/backup " where to put backup files
        set directory=~/.vim/temp " directory to place swap files in
    endif
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
    set wildmode=list:longest " turn on wild mode huge list
    let html_number_lines = 0
    let html_use_css = 0
    let use_xhtml = 0
    let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}

" Vim UI
    set incsearch " BUT do highlight as you type you search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows
    set list " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer

" Text Formatting/Layout
    set completeopt=menuone " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with set list on

" Folding
    set foldenable " Turn on folding
    set foldmethod=indent " Fold on the indent (damn you python)
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)

" Plugin Settings
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars inside strings
    let tlist_aspjscript_settings = 'asp;f:function;c:class'
    let tlist_aspvbs_settings = 'asp;f:function;s:sub'
    let tlist_php_settings = 'php;c:class;d:constant;f:function'
    let tlist_vb_settings = 'asp;f:function;c:class'
    let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin']
    let NERDChristmasTree = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 0

" Mappings
    " hit f11 to paste
    set pastetoggle=<f11>
    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>
    " fuzzymaps
    nmap <leader>f :FufFileWithCurrentBufferDir<CR>
    nmap <leader>ff :FufFile<CR>
    nmap <leader>b :FufBuffer<CR>
    nmap <leader>t :FufBufferTag<CR>
    nmap <leader>tt :FufBufferTagAll<CR>
    nmap <tab> :FufBufferTag<CR>
    " make arrow keys useful
    map <left> <ESC>:NERDTree<RETURN>
    map <right> <ESC>:TagbarToggle<RETURN>
    map <up> <ESC>:bp<RETURN>
    map <down> <ESC>:bn<RETURN>

" Autocommands
    " ruby standard 2 spaces, always
    au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
    au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " Override types
    au BufNewFile,BufRead *.ahk set filetype=ahk
    au BufNewFile,BufRead *.ps1 set filetype=ps1
    au BufNewFile,BufRead *.md set filetype=markdown
    au BufNewFile,BufRead *.dtl set filetype=htmldjango
    " Rainbow Parens
    runtime! plugin/rainbowparentheses.vim
    if exists(':RainbowParenthesesToggle') == 2
        au bufenter * RainbowParenthesesToggle
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    endif
    " Remember everything (position, folds, etc)
    au BufWinLeave ?* silent mkview
    au BufWinEnter ?* silent loadview

set guifont=SF\ Mono\ Medium\ 16
" GUI Settings
colorscheme hypsteria
if has("gui_running")
    " Basics
    colorscheme molokai
    set guifont=SF\ Mono\ Medium\ 16
    "set guifont=Consolas:h10 " My favorite font
    "set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
    "map <F12> <ESC>:set guifont=Consolas:h20<CR>
endif

" Term Settings
if s:colorful_term
    "256 color --
    let &t_Co=256
    " restore screen after quitting
    if has("terminfo")
       let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" Odds n Ends
set ttymouse=xterm2 " makes it work in everything
let g:molokai_original = 1
filetype plugin indent on 
" erlang format settings
autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang
" Pep-8 guidelines
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent 

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


au! BufNewFile,BufReadPost *.yaml, *yml
    \ set filetype=yaml 

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
syntax on " syntax highlighting on

map <C-n> :NERDTreeToggle<CR>
set tags=tags
let g:nerdtree_tabs_open_on_gui_startup=0

" Short cuts for ConqueTerm shell
map <leader>sh :set splitbelow<CR>:new<CR>:resize 10<CR>:ConqueTerm bash<CR>
map <leader>pp :set splitbelow<CR>:new<CR>:resize 10<CR>:ConqueTerm python3<CR>
map <leader>ss :set splitbelow<CR>:new<CR>:resize 10<CR>:ConqueTerm scala<CR>
map <leader>rr :set splitbelow<CR>:new<CR>:resize 10<CR>:ConqueTerm irb<CR>
set showcmd
" default templates for different files
" Below line can do it for all file extensions if you don't want to be
" explicit
" au BufNewFile * :silent! exec ":0r ".$VIMHOME."templates/".&ft
au BufNewFile *.html 0r ~/.vim/html5.html | let IndentStyle = "html"
" fzf related 
nnoremap <C-p> :<C-u>FZF<CR>
set spell spelllang=en_us
