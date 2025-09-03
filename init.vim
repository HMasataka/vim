if &compatible
  set nocompatible
endif

let mapleader = ","
let g:rc_dir = expand('~/.vim')

" Load configuration files
exec 'source ' . g:rc_dir . '/rc/plugins.vim'
exec 'source ' . g:rc_dir . '/rc/basic.vim'
exec 'source ' . g:rc_dir . '/rc/keymaps.vim'
exec 'source ' . g:rc_dir . '/rc/autocmds.vim'
exec 'source ' . g:rc_dir . '/rc/appearance.vim'
