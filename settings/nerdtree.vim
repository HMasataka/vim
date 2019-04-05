nnoremap <silent><C-k> :NERDTreeToggle<CR>
nnoremap <silent><C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1

let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '^__pycache__$[[dir]]', '^.git$[[dir]]']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
