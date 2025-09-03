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

" tag jump
nnoremap go %