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
Plugin 'dyng/ctrlsf.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elubow/cql-vim'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'Shougo/vimproc.vim'
" Haskell
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
" Scala
Plugin 'derekwyatt/vim-scala'
" Idris
Plugin 'idris-hackers/idris-vim'

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

setlocal spell " Check spelling
set complete+=kspell " Word completion <Cr>-N

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set list                        " show trailing whitespace
set listchars=tab:▸\ ,trail:▫   " show tabs and spaces
set showmode                    " show mode
set autoindent                  " use auto indentation

" Searching
set hlsearch                    " highlight all matches after entering a search pattern
set incsearch                   " highlight while searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" <leader>l redraws the screen and removes any search highlighting.
nnoremap <leader>l :nohlsearch<cr>

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

let NERDTreeIgnore=['\.swp$']
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

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
nnoremap <leader>rr :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>
nnoremap <leader>rc :VtrSendCommandToRunner<cr>
nnoremap <leader>rl :VtrSendLinesToRunner<cr>
nnoremap <leader>ra :VtrAttachToPane<cr>

" increase timeout
set timeoutlen=5000

" setup syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_idris_checkers = ['idris']
" super tab

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" Haskell autocomplete
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" enable built-in autocomplete
set omnifunc=syntaxcomplete#Complete

" insert new line without entering insert mode
nmap <S-Enter> O<Esc>

" CtrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec

