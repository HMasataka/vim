nnoremap <silent><C-f> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1

let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '^__pycache__$[[dir]]', '^.git$[[dir]]']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
