command! -nargs=1 Hi call Hi(<f-args>)
function! Hi(name)
  echo "Hi " . a:name
endfunction

" カレントファイルのパスをクリップボードにコピーする
command! -nargs=0 CPwd call CPwd()
function! CPwd()
  let fullpath = expand('%:p')
  let git_root = s:ensure_git_root()
  if git_root !=# ''
    let relative_path = substitute(fullpath, '^' . escape(git_root, '\') . '/', '', '')
    let @* = relative_path
    return
  endif
  let @* = fullpath
endfunction

" Gitのルートディレクトリを取得する
function! s:ensure_git_root() abort
  let cmd = 'git rev-parse --show-superproject-working-tree --show-toplevel 2>/dev/null | head -1'
  let root = system(cmd)->trim()->expand()
  if isdirectory(root)
    return root
  endif

  return ''
endfunction
