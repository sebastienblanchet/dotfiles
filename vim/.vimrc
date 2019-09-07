"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" @file .vimrc
" @brief personal config
" @author s3blanch@edu.uwaterloo.ca
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security, example in .C file, first line vim checks for initializations
" /* vim: set ts=8 sw=4 tw=0 noet : */
set modelines=0

set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vim-plug simplest
call plug#begin('~/.vim/plugged')
" TODO: add plugins here
call plug#end()

runtime! macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show current mode
set showmode

" Hybrid line numbers
set number relativenumber

set showmode

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beepin
set visualbell

" Color scheme and set 256 colors
colorscheme jellybeans
set t_Co=256

" Highlight current line
set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smarttab
set backspace=indent,eol,start

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2 ""width of TAB character \ t
set shiftwidth=2 "" indent width
set softtabstop=2 "" number of colums for \ t
set expandtab "" expand \ t to space
set noshiftround

" Visualize tables and eols
set list
set listchars=tab:▸\ ,eol:¬
" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

" Sublime like moving around
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Strip all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS BAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" from https://dustri.org/b/lightweight-and-sexy-status-bar-in-vim.html
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO
" update following key bindings
" " Cursor motion
" set scrolloff=3
" set matchpairs+=<:> " use % to jump between pairs

" " Move up/down editor lines
" nnoremap j gj
" nnoremap k gk

" " Allow hidden buffers
" set hidden

" " Rendering
" set ttyfast

" " Last line
"set showmode
"set showcmd

" " Searching
" nnoremap / /\v
" vnoremap / /\v

" map <leader><space> :let @/=''<cr> " clear search

" set hlsearch
" set incsearch
" set ignorecase

" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>

" " Formatting
" map <leader>q gqip

" " Uncomment this to enable by default:
" " set list " To enable by default
" " Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL

