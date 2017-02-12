" This configuration doesn't require any plugin
" This line will load the other configuration file with plugins, enable it only if it's needed
" source /home/cproiett/.plugins_vim 

" Set color to molokai
colorscheme molokai

" Enable arrow keys and others in Vim 
set nocompatible

" Set the command history to 1000 commands
set history=1000

" Remap jj to work as Esc in insert mode
imap jj <Esc>
" Remap ; to : on normal and visual mode
nnoremap ; :                                                                                       
vnoremap ; :
" Remap F2 to show and change between paste and no-past mode under normal
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
" Copy selected text (ctrl-c)
vmap <C-c> y
" Paste clipboard contents (ctrl-v)
imap <C-v> <Esc>p
" Cut selected text (ctrl-x)
vmap <C-x> x

" Highlight the current column every window
set cursorcolumn
" Highlight the current line in every window
set cursorline

" Insert a line to show the limit of the 80 characters
set colorcolumn=81
" Insert the text limit to 80 characters
set textwidth=80
" Wrap the text automatically without breaking the words
set formatoptions+=w

" Show the number of the line on the left side
set number
" Set the total space of the lateral numbered bar
set numberwidth=5
" Show the relative number on the lateral numbered bar 
set relativenumber

" Add the indent equale to the previous line
set autoindent

" Highlight and color source code
syntax on

" Modify the default view of Explorer like NerdTree style
let g:netrw_liststyle=3

" Show INSERT or REPLACE mode on the bottom line
set showmode

" Show the default ruler on the bottom
set ruler
" Show always the status line
set laststatus=2

" Show the command inserted into the command line
set showcmd

" Series of commands to autosave your job
" Save when you change your focus from VIM
:au FocusLost * silent! wa
"Save the buffer when you switch on something different
set autowrite
"Save the buffer always automatically
set autowriteall
" Save backup files into a different directory (files ~)        
set backupdir=~/.vim/.backup//
" Save swap files into a different directory        
set directory=~/.vim/.swap//
" Save undo's after file closes
set undofile               
" Save undo directory files into a different directory        
set undodir=~/.vim/.undo// 
" Set how many levels of undo are saved
set undolevels=1000
" Set how many number of lines to save for undo
set undoreload=10000
" Autoload a file when it changes
set autoread

" Set backspace to work in insert mode on indentation, eol or start
set backspace=indent,eol,start

" Show an alert when inserted a wrong command
set errorbells 
" Send a visual alert instead of a beep when there is an error
set visualbell

" Set global option on the search
set gdefault
" Set the search to ignore the case
set ignorecase
" Only if a pattern contains an uppercase letter it is case sensitive
set smartcase
" Show the next match while entering a search
set hlsearch
" Highlight all the search matches
set incsearch
" It jump to the searched word
set showmatch

" Insert spaces whenever the tab key is used. To use the real Tab you must 
" insert the character sequence Ctrl-V<Tab>
set noexpandtab
" Number of space inserted when tab is pressed 
set tabstop=4
" Number of space inserted for indentation
set shiftwidth=4
" Number of column used when tab is pressed 
set softtabstop=4

" Set your default shell, in my case Bash
set shell=/bin/bash

" Set the command line completition with tab
set wildmenu
" show on the first tab a list of the longest commands and after all the others
set wildmode=list:longest,full

" When a file is opened if there is a plugin it will be identified
filetype plugin on

" Set a completition menu with a popup like an IDE
set completeopt=longest,menuone,preview 
