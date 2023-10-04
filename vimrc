scriptencoding utf-8

let g:polyglot_disabled = ['sensible']

if has('vim_starting')
  set runtimepath^=~/dotfiles/vim runtimepath+=~/dotfiles/vim/after
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  silent! execute pathogen#infect()
endif

set autoindent
set breakindent showbreak=\ +
set linebreak
set shiftround

set encoding=utf-8
set fileformats=unix,dos
set ignorecase
set nojoinspaces
set smartcase

set cursorline
set guioptions=
set list
set shortmess+=aI

set undofile
set directory=~/.vim-swap
set undodir=~/.vim-undo
set viewdir=~/.vim-view
set viminfo+=n~/.viminfo

if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  let &listchars="tab:\u25ba\u00b7,trail:\u02cd,extends:\u25ba,precedes:\u25c4,nbsp:\u25e6"
  let &fillchars="vert:\u25d8,fold:\u00b7,eob:~"
endif

" set clipboard=exclude:.*
" setglobal commentstring=#\ %s
" set virtualedit=block
" set wildmode=longest:full,full
" set wildignore+=tags,.*.un~,*.pyc
" set winaltkeys=no

" set foldlevel=3
" set foldmethod=syntax
" set foldopen+=jump

" set lazyredraw
" set showmatch
" set sidescrolloff=5
" set statusline=%F%m%r%h%w\ %<[%{&ff}]\ %y\ [ascii=\%05.5b]\ [hex=\%04.4B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
" set timeoutlen=1200
" set ttimeoutlen=50

" set mouse=
" set pastetoggle=<F2>

" let g:netrw_banner=0
" let g:netrw_liststyle=3
" let g:netrw_browse_split=4
" let g:netrw_dirhistmax=0

" let g:is_bash = 1
" let g:sh_noisk = 1
let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'bash=sh', 'sh']
" let g:ragtag_global_maps = 1
let g:surround_indent = 1
let g:sql_type_default = "plsql"
let g:solarized_diffmode = "high"
let g:solarized_visibility = "low"
let g:solarized_termcolors_blacks_reversed = 1

" noremap  <S-Insert> <MiddleMouse>
" noremap! <S-Insert> <MiddleMouse>

noremap   Q  <Nop>
inoremap  jj <Esc>
vnoremap  v  <Esc>

noremap   <Space> <Nop>
sunmap    <Space>

map   <Up>        <Nop>
map   <Down>      <Nop>
map   <Left>      <Nop>
map   <Right>     <Nop>
map   <Home>      <Nop>
map   <End>       <Nop>
map   <PageUp>    <Nop>
map   <PageDown>  <Nop>

imap  <Up>        <Nop>
imap  <Down>      <Nop>
imap  <Left>      <Nop>
imap  <Right>     <Nop>
imap  <Home>      <Nop>
imap  <End>       <Nop>
imap  <PageUp>    <Nop>
imap  <PageDown>  <Nop>

augroup AutoView
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

augroup FileTypes
  autocmd!
  " autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == "" | set ft=text | endif
  " autocmd BufNewFile,BufRead *.pls,*.plsql,*.sql,*.trg,*.pkb,*.pks,*.fnc set ft=sql
  " autocmd BufNewFile,BufRead *.md set ft=markdown
  " autocmd BufNewFile,BufRead Dockerfile.* set ft=dockerfile

  " autocmd FileType sh,zsh,csh,tcsh let &l:path = substitute($PATH, ':', ',', 'g')
  " autocmd FileType javascript,json set shiftwidth=2 softtabstop=2 expandtab
  " autocmd FileType sh,zsh,csh,tcsh set shiftwidth=2 softtabstop=2 expandtab
  " autocmd FileType perl set shiftwidth=4 softtabstop=4 expandtab
  " autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
  " autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
augroup END

if &t_Co > 2 || has("gui_running")
  function! s:initialize_font()
    if exists("&guifont")
      if has("mac")
        set guifont=Monaco:h10
      elseif has("unix")
        if &guifont == ""
          set guifont=Monospace\ Medium\ 10
        endif
      elseif has("win32") || has("win64")
        set guifont=Consolas:h9,Courier\ New:h8
      endif
    endif
  endfunction

  if has("gui_running") || system("uname -a") =~ "microsoft"
    set background=light
  else
    set background=dark
  endif

  silent! colorscheme solarized

  augroup Visuals
    autocmd!
    autocmd GUIEnter * call s:initialize_font()
    if v:lang =~? "pl"
      autocmd GUIEnter * simalt ~s
    else
      autocmd GUIEnter * simalt ~x
    endif
  augroup END
endif

if has("diff") && &diff
  set winwidth&

  nnoremap <silent> dR :diffupdate<CR>
  nnoremap <silent> dI :call ToggleDiffOptIWhite()<CR>
  nnoremap <silent> dC :call ToggleDiffOptICase()<CR>

  function! ToggleDiffOptIWhite()
    if &diffopt =~ 'iwhite'
      set diffopt-=iwhite
    else
      set diffopt+=iwhite
    endif
  endfunction

  function! ToggleDiffOptICase()
    if &diffopt =~ 'icase'
      set diffopt-=icase
    else
      set diffopt+=icase
    endif
  endfunction
endif

