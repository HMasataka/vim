set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '/.vim/dein/toml')

	let g:dein#cache_directory = $HOME . '/.cache/dein'

	call dein#begin($HOME . '/.vim/dein')

	let s:toml_dir  = $HOME . '/.vim/dein/toml' 
	let s:toml      = s:toml_dir . '/dein.toml'
	let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

""""""""""""""""""""""""" 表示関連 """"""""""""""""""""""""""""""""""""""""

" no beep
set belloff=all

" display number of line
set number
set relativenumber

" always display status bar
set laststatus=2

" scroll margin
set scrolloff=4

" display command during input
set showcmd

" spell check
set spelllang+=cjk
set spell

" highlight the line number of the current line
set cursorline

""""""""""""""""""""""""" 編集関連 """"""""""""""""""""""""""""""""""""""""
" use backspace
set backspace=indent,eol,start

" backup
set backup
set backupdir=~/.vim/tmp

" dont create swap file
set noswapfile
set directory=~/.vim/tmp

" save undofile
set undofile
set undodir=~/.vim/tmp

" switching file without save
set hidden

" space instead of tab
set expandtab

" display tab width
set tabstop=4

" input tab width
set shiftwidth=4

" continue indentation of previous line at line feed
set autoindent
set smartindent

" window size
set noequalalways

" num : history
set history=50

" mouse activation
" set mouse=a

" by default, g option for replacement is enabled
set gdefault

" tab key completion in command line mode
set wildmenu

" move the cursor to the end of the line one character ahead
set virtualedit=onemore


""""""""""""""""""""""""" 検索関連 """"""""""""""""""""""""""""""""""""""""

" do not distinguish upper or lower when searching
set ignorecase

" highlight all search results
set hlsearch
set incsearch


""""""""""""""""""""""""" script """"""""""""""""""""""""""""""""""""""""
" Restore the last cursor position when opening a file
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

set autoread
augroup vimrc-checktime
  autocmd!
  autocmd CursorMoved * checktime
augroup END

"""""""""""""""""""""""""terminal""""""""""""""""""""""""""""""""""""""""
set splitbelow
set termwinsize=6x0
tnoremap <Esc> <C-w>N

noremap <silent> <space>t :call TermOpen()<CR>
noremap <silent> <space>q :call ExitTermAbs()<CR>

function! TermOpen()
    if empty(term_list())
        execute "terminal"
    else
        call win_gotoid(win_findbuf(term_list()[0])[0])
    endif
endfunction

augroup term-exit
  autocmd!
  autocmd BufEnter * call ExitTerm()
augroup END

function! CreateBufnr2tabnrDict() abort " {{{
  let bufnr2tabnr_dict = {}
  for tnr in range(1, tabpagenr('$'))
    for bnr in tabpagebuflist(tnr)
      let bufnr2tabnr_dict[bnr] = has_key(bufnr2tabnr_dict, bnr) ? add(bufnr2tabnr_dict[bnr], tnr) : [tnr]
    endfor
  endfor
  for val in values(bufnr2tabnr_dict)
    call uniq(sort(val))
  endfor
  return bufnr2tabnr_dict
endfunction " }}}

function! Bufnr2tabnr(bnr) abort " {{{
  return CreateBufnr2tabnrDict()[a:bnr]
endfunction " }}}

function! ExitTerm()
    if !empty(term_list())
        let term_tabnr = Bufnr2tabnr(term_list()[0])
        let num_win_in_tabnr = tabpagewinnr(term_tabnr[0], '$')
        if num_win_in_tabnr == 1
            call term_sendkeys(term_list()[0], "exit\<CR>")
        endif
    endif
endfunction

function! ExitTermAbs()
    call term_sendkeys(term_list()[0], "exit\<CR>")
endfunction

"""""""""""""""""""""""""キーバインド  """"""""""""""""""""""""""""""""""""""""
" unhighlight
noremap <Esc><Esc> :noh<CR>

" open link file
noremap <space>n <C-w>gf

" increment number
noremap <C-c> <C-a>

" movement on display instead of actual line
noremap j gj
noremap k gk

" switching ; :
noremap ; :
noremap : ;

" make line break possible in the middle of the line
noremap <CR> A<CR><ESC>

" Ctrl+j associate to ESC
noremap! <C-j> <Esc>
noremap <C-j> :noh<CR>

" Ctrl+l associate to Right arrow
inoremap <C-l> <Right>

" change cursor shape when insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" move the cursor to end of line by Ctrl+e
inoremap <C-e> <Esc><S-a>
noremap <C-e> $

" move the cursor to begin of line by Ctrl+a
inoremap <C-a> <Esc><S-i>
noremap <C-a> ^

" don't use arrow key
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>

noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <nop>

" splitting screen
noremap ss :split<CR>
noremap sv :vsplit<CR>
noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l

" moving screen
noremap sH <C-w>H
noremap sJ <C-w>J
noremap sK <C-w>K
noremap sL <C-w>L

" tab
noremap st :tabnew<CR>
noremap sn gt
noremap su gT
" s<N> jump to N tab
for n in range(1, 9)
    execute 'nnoremap <silent> s'.n ':<C-u>tabnext' .n.'<CR>'
endfor

" tailing blanks removed
noremap <F2> :%s/\s\s*$<CR>

" tag jump
noremap go %

set t_Co=256
colorscheme mstn3
