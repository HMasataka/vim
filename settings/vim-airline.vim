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
