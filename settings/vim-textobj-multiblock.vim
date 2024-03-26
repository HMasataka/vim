omap <silent> ab <Plug>(textobj-multiblock-a)
omap <silent> ib <Plug>(textobj-multiblock-i)
xmap <silent> ab <Plug>(textobj-multiblock-a)
xmap <silent> ib <Plug>(textobj-multiblock-i)

let g:textobj_multiblock_blocks = [
\	[ "(", ")" ],
\	[ "[", "]" ],
\	[ "{", "}" ],
\	[ '<', '>' ],
\	[ '"', '"', 1 ],
\	[ "'", "'", 1 ],
\ ]
