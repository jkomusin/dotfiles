" Credit for much of this goes to Yan Pritzker, see https://github.com/skwp/dotfiles
" ++++++++++++++++++++++++++++++++++++++++++++++++++++

" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Vundle Initialization ==============

filetype off  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" :PluginInstall to get new, :PluginUpdate to update
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jmcantrell/vim-virtualenv'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================

set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

:let mapleader = "<space>"            "Space is a nice leader

" enable solarized (http://ethanschoonover.com/solarized)
"if has('gui_running')
"  set background=light
"else
set background=dark
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    let g:solarized_termcolors = 256
  endif
endif
"endif
colorscheme solarized

" ================ Syntax ===========================

" turn on syntax highlighting
syntax on
let python_highlight_all=1

" Set 80-column indicator
let &colorcolumn=join(range(81,999),",")

" HTML/CSS syntax highlighting in JavaScript
let g:javascript_enable_domhtmlcss = 1

" Disable formatting .go files on save
let g:go_fmt_autosave = 0

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Python PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" 2-spaces for web code
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" ================ Virtualenv Support ===============

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Shortcut for go-to definition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ================ NERD Tree Config =================

autocmd vimenter * NERDTree     "Open NERDTree on launch
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"autocmd BufEnter * lcd %:p:h    "Change dir on every buffer change
"let g:NERDTreeChDirMode=2       "Move NERDTree dir with :cd command

" Every time you focus a modifiable buffer, refresh NERDTree and focus the
" buffer
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
"set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set shiftround

" Viewing an XML file will pass it through xmllint first
"au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Splits ===========================

set splitbelow
set splitright

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Commands =========================

command! Json execute "%!python -m json.tool"
command! Xml execute "%!xmllint --format -"

" ================ Remappings =======================

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

