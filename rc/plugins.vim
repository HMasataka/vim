" vim-plug install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'vim-jp/vimdoc-ja'

Plug 'vim-denops/denops.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
exec 'source ' . g:rc_dir . '/settings/coc-vim.vim'

Plug 'terryma/vim-expand-region'

Plug 'kana/vim-operator-user'

Plug 'kana/vim-operator-replace'
exec 'source ' . g:rc_dir . '/settings/vim-operator-replace.vim'

Plug 'preservim/nerdtree'
exec 'source ' . g:rc_dir . '/settings/nerdtree.vim'

Plug 'kana/vim-textobj-user'

Plug 'osyo-manga/vim-textobj-multiblock'
exec 'source ' . g:rc_dir . '/settings/vim-textobj-multiblock.vim'

Plug 'easymotion/vim-easymotion'
exec 'source ' . g:rc_dir . '/settings/vim-easymotion.vim'

Plug 'bling/vim-airline'
exec 'source ' . g:rc_dir . '/settings/vim-airline.vim'

Plug 'Yggdroot/indentLine'
exec 'source ' . g:rc_dir . '/settings/indentLine.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-obsession'

Plug 'segeljakt/vim-silicon'
exec 'source ' . g:rc_dir . '/settings/silicon.vim'

Plug 'sheerun/vim-polyglot'
exec 'source ' . g:rc_dir . '/settings/vim-polyglot.vim'

Plug 'airblade/vim-gitgutter'
exec 'source ' . g:rc_dir . '/settings/vim-gitgutter.vim'

Plug 'vim-skk/denops-skkeleton.vim'
exec 'source ' . g:rc_dir . '/settings/denops-skkeleton.vim'

Plug 'shg-eo/skkeleton-azik'
exec 'source ' . g:rc_dir . '/settings/skkeleton-azik.vim'

Plug 'jjo/vim-cue'

Plug 'tomtom/tcomment_vim'

Plug 'github/copilot.vim'

Plug 'mattn/emmet-vim'
exec 'source ' . g:rc_dir . '/settings/emmet-vim.vim'

Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
exec 'source ' . g:rc_dir . '/settings/previm.vim'

Plug 'cohama/lexima.vim'

Plug 'cappyzawa/go-playground.nvim'

Plug 'mattn/vim-goimports'

Plug 'jsborjesson/vim-uppercase-sql'

Plug 'mattn/vim-maketable'

Plug 'mattn/vim-goaddtags'
exec 'source ' . g:rc_dir . '/settings/vim-goaddtags.vim'

call plug#end()
