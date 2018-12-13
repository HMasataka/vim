""""""""""""""""""""""""" 表示関連 """"""""""""""""""""""""""""""""""""""""
" TODO
" snipet plugin
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

" unhighlight
noremap <Esc><Esc> :noh<CR>

""""""""""""""""""""""""" キーバインド """"""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""" dein.vim plugins """"""""""""""""""""""""""""""""""""""""

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

filetype plugin on
runtime macros/matchit.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/deoplete.nvim')

"" deoplete extension plugins
" completion vim command
call dein#add('Shougo/neco-vim')
" completion from syntaxfile
call dein#add('Shougo/neco-syntax')
" completion English word from look function
call dein#add('ujihisa/neco-look')
" completion python function
call dein#add('zchee/deoplete-jedi')

if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('sjl/gundo.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('bling/vim-airline')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('pangloss/vim-javascript')
call dein#add('mattn/emmet-vim')
call dein#add('othree/html5.vim')
call dein#add('nvie/vim-flake8')
call dein#add('simeji/winresizer')
call dein#add('tomtom/tcomment_vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-surround')
call dein#add("vim-scripts/vim-auto-save")
call dein#add("terryma/vim-expand-region")
call dein#add("jacquesbh/vim-showmarks")

" replace by text object
call dein#add('kana/vim-operator-replace.git')
call dein#add('kana/vim-operator-user.git')
map R  <Plug>(operator-replace)

call dein#end()

if dein#check_install()
  call dein#install()
endif

""""""""""""""""""""""""" dein.vim """"""""""""""""""""""""""""""""""""""""

" DeinClean command
command! -bang DeinClean call s:dein_clean(<bang>0)

function! s:dein_clean(force) abort "{{{
    let del_all = a:force
    for p in dein#check_clean()
        if !del_all
            let answer = s:input(printf('Delete %s ? [y/N/a]', fnamemodify(p, ':~')))

            if type(answer) is type(0) && answer <= 0
                " Cancel (Esc or <C-c>)
                break
            endif

            if answer !~? '^\(y\%[es]\|a\%[ll]\)$'
                continue
            endif

            if answer =~? '^a\%[ll]$'
                let del_all = 1
            endif
        endif

        " Delete plugin dir
        call dein#install#_rm(p)
    endfor
endfunction "}}}

function! s:input(...) abort "{{{
    new
    cnoremap <buffer> <Esc> __CANCELED__<CR>
    try
        let input = call('input', a:000)
        let input = input =~# '__CANCELED__$' ? 0 : input
    catch /^Vim:Interrupt$/
        let input = -1
    finally
        bwipeout!
        return input
    endtry
endfunction "}}}

""""""""""""""""""""""""" deoplete.vim"""""""""""""""""""""""""""""""

" activate python3
set pyxversion=3
" activate deoplete by default
let g:deoplete#enable_at_startup = 1

" delay when displaying completion[msec]
call deoplete#custom#option('auto_complete_delay', 1)
" do not distinguish upper or lower when completion
call deoplete#custom#option('camel_case', 1)
" number of candidates displayed in the pop-up mene. default 500
call deoplete#custom#option('max_list', 20)
" number of characters to be completed
call deoplete#custom#option('min_pattern_length', 1)
" selects the first position of the completion candidate
set completeopt+=noinsert

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() :"\<CR>"

"""""""""""""""""""""""""""" denite.vim""""""""""""""""""""""""""""""""""""

" recently used files list
noremap <silent> <space>s :<C-u>Denite file_mru<CR>
" current directory
noremap <silent> <space>a :<C-u>Denite file_rec<CR>
" yank history
noremap <silent> <C-s> :<C-u>Denite neoyank<CR>
" denite associate to search
nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-resize line<CR>
call denite#custom#map('insert', "<C-n>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

""""""""""""""""""""""""""""""Gundo"""""""""""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

""""""""""""""""""""""""""""""indentline"""""""""""""""""""""""""""""""""""

let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'

""""""""""""""""""""""""""""""airline"""""""""""""""""""""""""""""""""""

let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
\ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
\ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
\ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0

" apply airline to tablines
let g:airline#extensions#tabline#enabled = 1
" when there is only one tab, Turn off the function to display the list of buffers on tablines
let g:airline#extensions#tabline#show_buffers = 0
" 0, the number of open windows on that tab, 1 means the number of consecutive numbers from the left tab
let g:airline#extensions#tabline#tab_nr_type = 1
" display name in tablines
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""emmet"""""""""""""""""""""""""""""""""""

let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \ 'html' : {
    \   'filters' : 'html',
    \ },
  \ 'css' : {
    \   'filters' : 'fc',
    \ },
  \ 'php' : {
    \   'extends' : 'html',
    \   'filters' : 'html',
    \ },
  \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END

""""""""""""""""""""""""" winresizer.vim """"""""""""""""""""""""""""""""""""""""

let g:winresizer_start_key = '<C-q>'

"""""""""""""""""""""""""gitgutter""""""""""""""""""""""""""""""""""""""""
" make the update timing faster. defalult 4000ms
set updatetime=250
" anti alias
set signcolumn=yes
" Gstatus
noremap gs :Gstatus<CR>
" Gdiff
noremap gf :Gdiff<CR>
" Gpush
" TODO 現在の状態を取得してそこをデフォルトに
noremap gp :Git push origin

"""""""""""""""""""""""""fugitive""""""""""""""""""""""""""""""""""""""""
noremap mh :GitGutterNextHunk<CR>
noremap mH :GitGutterPrevHunk<CR>

""""""""""""""""""""""""" auto-save """"""""""""""""""""""""""""""""""""""""
let g:auto_save = 1

""""""""""""""""""""""""" scripts """"""""""""""""""""""""""""""""""""""""
" Restore the last cursor position when opening a file
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

"""""""""""terryma/vim-expand-region"""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"""""""""""vim-showmarks"""""""""""
augroup vimrc-showmarks
  autocmd!
  " autocmd VimEnter * DoShowMarks
  autocmd VimLeavePre * delmarks!
augroup END
noremap <silent> <space>m :10PreviewMarks<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoread
augroup vimrc-checktime
  autocmd!
  autocmd CursorMoved * checktime
augroup END

augroup load-json
  autocmd!
  autocmd FileType json set conceallevel=0
augroup END

set t_Co=256
syntax on

" set up my color scheme
colorscheme mstn3
