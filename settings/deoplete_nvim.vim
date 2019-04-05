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
