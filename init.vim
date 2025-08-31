if &compatible
  set nocompatible
endif


let mapleader = ","
let g:rc_dir = expand('~/.vim')

" vim-plug install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'vim-jp/vimdoc-ja'

Plug 'vim-denops/denops.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
exec 'source ' . g:rc_dir . '/settings/coc-vim.vim'

Plug 'terryma/vim-expand-region'

Plug 'kana/vim-operator-user'

Plug 'kana/vim-operator-replace'
exec 'source ' . g:rc_dir . '/settings/vim-operator-replace.vim'

Plug 'preservim/nerdtree'
exec 'source ' . g:rc_dir . '/settings/nerdtree.vim'

Plug 'kana/vim-textobj-user'

Plug 'osyo-manga/vim-textobj-multiblock'
exec 'source ' . g:rc_dir . '/settings/vim-textobj-multiblock.vim'

Plug 'easymotion/vim-easymotion'
exec 'source ' . g:rc_dir . '/settings/vim-easymotion.vim'

Plug 'bling/vim-airline'
exec 'source ' . g:rc_dir . '/settings/vim-airline.vim'

Plug 'Yggdroot/indentLine'
exec 'source ' . g:rc_dir . '/settings/indentLine.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-obsession'

Plug 'segeljakt/vim-silicon'
exec 'source ' . g:rc_dir . '/settings/silicon.vim'

Plug 'sheerun/vim-polyglot'
exec 'source ' . g:rc_dir . '/settings/vim-polyglot.vim'

Plug 'airblade/vim-gitgutter'
exec 'source ' . g:rc_dir . '/settings/vim-gitgutter.vim'

Plug 'vim-skk/denops-skkeleton.vim'
exec 'source ' . g:rc_dir . '/settings/denops-skkeleton.vim'

Plug 'shg-eo/skkeleton-azik'
exec 'source ' . g:rc_dir . '/settings/skkeleton-azik.vim'

Plug 'jjo/vim-cue'

Plug 'tomtom/tcomment_vim'

Plug 'github/copilot.vim'

Plug 'mattn/emmet-vim'
exec 'source ' . g:rc_dir . '/settings/emmet-vim.vim'

Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
exec 'source ' . g:rc_dir . '/settings/previm.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'mattn/vim-goimports'

Plug 'jsborjesson/vim-uppercase-sql'

Plug 'mattn/vim-maketable'

Plug 'mattn/vim-goaddtags'
exec 'source ' . g:rc_dir . '/settings/vim-goaddtags.vim'

call plug#end()

syntax on

set encoding=utf8
set fileencodings=utf-8

set helplang=ja,en

set signcolumn=yes

" backup
set backup
set backupdir=~/.vim/tmp

" don't create swap file
set noswapfile
set directory=~/.vim/tmp

" save undofile
set undofile
set undodir=~/.vim/tmp

set belloff=all

" always show status line
set laststatus=2

" set scroll margin
set scrolloff=999

" always show line number
set number

set autoindent
set smartindent

set showcmd
set wildmenu

set backspace=indent,eol,start

set incsearch
set hlsearch

" only when capital letters are entered, set to be case-sensitive.
set ignorecase
set smartcase

set cursorline

" default g option on replace
set gdefault

set virtualedit=onemore

nnoremap ; :

" Ctrl+j associate to ESC
noremap! <C-j> <Esc>
noremap <C-j> :noh<CR>

" increment number
nnoremap <C-c> <C-a>

" movement on display instead of actual line
nnoremap j gj
nnoremap k gk

" change cursor shape when insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Ctrl+l associate to Right arrow
inoremap <C-l> <Right>

" move the cursor to end of line by Ctrl+e
inoremap <C-e> <Esc><S-a>
noremap <C-e> $

" move the cursor to begin of line by Ctrl+a
inoremap <C-a> <Esc><S-i>
noremap <C-a> ^

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>
noremap <MiddleMouse> <Nop>

" splitting screen
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" moving screen
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

" copy to clipboard
noremap <Space>y "*y
noremap <Space>p "*p

" tab
nnoremap st :tabnew<CR>
nnoremap sn gt
nnoremap su gT

" buffer
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" s<N> jump to N tab
for n in range(1, 9)
    execute 'nnoremap <silent> s'.n ':<C-u>tabnext' .n.'<CR>'
endfor

" sw<N> jump to N window
for n in range(1, 9)
    execute 'nnoremap <silent> sw'.n ':<C-u>call win_gotoid(win_getid('. n .'))<CR>'
endfor

" reload file
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd CursorMoved * checktime
augroup END

" Restore the last cursor position when opening a file
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" tag jump
nnoremap go %

colorscheme mstn3
