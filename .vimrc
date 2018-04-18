" This configuration doesn't require any plugin
" This line will load the other configuration file with plugins, enable it only if it's needed
" source /home/cproiett/.plugins_vim 
" Set color to molokai
colorscheme molokai
" Remap jj to work as Esc in insert mode
imap jj <Esc>
" Paste clipboard contents (ctrl-v)
imap <C-v> <Esc>p
" Modify the default view of Explorer like NerdTree style
let g:netrw_liststyle=3
" Remap ; to : on normal and visual mode
nnoremap ; :                                                                                       
vnoremap ; :
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Remap space to fold lines
noremap <space> za |
" Remap F2 to show and change between paste and no-past mode under normal
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
" Save when you change your focus from VIM
:au FocusLost * silent! wa
" Highlight and color source code
syntax on
" Add the indent equale to the previous line
set autoindent
" Autoload a file when it changes
set autoread
"Save the buffer when you switch on something different
set autowrite
"Save the buffer always automatically
set autowriteall
" Set backspace to work in insert mode on indentation, eol or start
set backspace=indent,eol,start
" Save backup files into a different directory (files ~)        
set backupdir=~/.vim/.backup//
" Save swap files into a different directory        
set directory=~/.vim/.swap//
" Set the maximum line size
set colorcolumn=100
" Set a completition menu with a popup like an IDE
set completeopt=longest,menuone,preview 
" Highlight the current column every window
set cursorcolumn
" Highlight the current line in every window
set cursorline
" Show an alert when inserted a wrong command
set errorbells 
" Set the filetype to Unix for the return carriage
set fileformat=unix
" Enable line folding
set foldmethod=indent |
set foldlevel=99
" Wrap the text automatically without breaking the words
set formatoptions+=w
" Set global option on the search
set gdefault
" Set the command history to 1000 commands
set history=1000
" Show the next match while entering a search
set hlsearch
" Highlight all the search matches
set incsearch
" Set the search to ignore the case
set ignorecase
" Show always the status line
set laststatus=2
" Insert spaces whenever the tab key is used. To use the real Tab you must 
" insert the character sequence Ctrl-V<Tab>
set noexpandtab
" Enable arrow keys and others in Vim 
set nocompatible
" Show the number of the line on the left side
set number
" Set the total space of the lateral numbered bar
set numberwidth=5
" Show the relative number on the lateral numbered bar 
set relativenumber
" Show the default ruler on the bottom
set ruler
" Set your default shell, in my case Bash
set shell=/bin/bash
" Number of space inserted for indentation
set shiftwidth=4
" Show the command inserted into the command line
set showcmd
" It jump to the searched word
set showmatch
" Show INSERT or REPLACE mode on the bottom line
set showmode
" Only if a pattern contains an uppercase letter it is case sensitive
set smartcase
" Number of column used when tab is pressed 
set softtabstop=4
" Enable split on the right
set splitright
" Number of space inserted when tab is pressed 
set tabstop=4
" Set the command line completition with tab
" Save undo's after file close
set undofile               
" Save undo directory files into a different directory        
set undodir=~/.vim/.undo// 
" Set how many levels of undo are saved
set undolevels=1000
" Set how many number of lines to save for undo
set undoreload=10000
" Send a visual alert instead of a beep when there is an error
set visualbell
" Set command line completition
set wildmenu
" show on the first tab a list of the longest commands and after all the others
set wildmode=list:longest,full
" When a file is opened if there is a plugin it will be identified
filetype plugin on

au BufNewFile,BufRead *.py,
	\ set encoding=utf-8 | 
	\ set tabstop=4 |
	\ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
	\ set colorcolumn=100

au BufNewFile,BufRead *.js,*.html,*.css,
    \ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" Cut selected text (ctrl-x)
vmap <C-x> x
" Copy selected text (ctrl-c)
vmap <C-c> y
