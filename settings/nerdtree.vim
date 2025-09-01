nnoremap <silent><C-f> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1

let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '^__pycache__$[[dir]]', '^.git$[[dir]]']

" Close Vim if NERDTree is the only window remaining in the only tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree automatically when vim is started without file arguments
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
