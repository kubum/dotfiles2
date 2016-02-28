set nocompatible          " be iMproved, required
filetype off              " required

" enable matchit for enchanced %
runtime macros/matchit.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-bundler'
Plugin 'airblade/vim-gitgutter'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ecomba/vim-ruby-refactoring'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype on                  " required
filetype plugin indent on    " required

syntax enable                " highlight syntax

set encoding=utf-8
set showcmd                     " display incomplete commands

" Colors
set t_Co=256
set term=screen-256color
colorscheme railscasts
" Set Leader
let mapleader=","

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set list                        " show trailing whitespace
set listchars=tab:▸\ ,trail:▫   " show tabs and spaces

" Searching
set hlsearch                    " highlight all matches after entering a search pattern
set incsearch                   " highlight while searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" View
set relativenumber 
set number 
set ruler                                                    " show where you are

" Menu
set wildmenu
set wildmode=longest:list,full
set laststatus=2                                             " always show statusline

" Ctags
set tags=./tags
" Open tags in a new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Use ack instead of grep
set grepprg=ack

" GitGutter
set updatetime=1000 "default: 4000

" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

let NERDTreeShowHidden=1

" Ag
let g:ag_working_path_mode="ra"

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Unset arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Mouse
set mouse=a

" Hightlight 80 chars
set cc=80

" Set Leader
let mapleader=","

" Clipboard sync
set clipboard=unnamed

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" vim-tmux-runner
nnoremap <leader>orr :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
nnoremap <leader>scr :VtrSendCommandToRunner<cr>
nnoremap <leader>slr :VtrSendLinesToRunner<cr>
nnoremap <leader>apr :VtrAttachToPane<cr>

" increase timeout
set timeoutlen=5000

