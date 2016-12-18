" based on https://github.com/tpope/tpope/blob/master/.vimrc

scriptencoding utf-8

if has('vim_starting')
  set runtimepath=~/dotfiles/vim,$VIMRUNTIME,~/dotfiles/vim/after
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  silent! execute pathogen#infect()
endif

set nocompatible
set autoindent
set autoread
"set autowrite
set backspace=2
if exists('+breakindent')
  set breakindent showbreak=\ +
endif
set cmdheight=1
setglobal commentstring=#\ %s
set complete-=i
set cursorline
set display=lastline
set encoding=utf-8
set fileformats=unix,dos
set foldlevel=3
set foldmethod=syntax
set foldopen+=jump
if v:version + has("patch541") >= 704
  set formatoptions+=j
endif
set history=200
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak

if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  let &listchars = "tab:\u25ba\u00b7,trail:\u02cd,extends:\u25ba,precedes:\u25c4,nbsp:\u25e6"
  let &fillchars = "vert:\u25d8,fold:\u00b7"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif
if exists('+macmeta')
  set macmeta
endif
set mouse=
set nobackup
"set nowrap
set nrformats-=octal
set pastetoggle=<F2>
set scrolloff=1
set sessionoptions-=options
set shiftround
set shortmess+=aI
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=5
set smartcase
set smarttab
set statusline=%F%m%r%h%w\ %<[%{&ff}]\ %y\ [ascii=\%05.5b]\ [hex=\%04.4B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set timeoutlen=1200
set ttimeout
set ttimeoutlen=50
set viewdir=~/.vim-view
set viewoptions-=options
if v:version >= 700
  set viminfo=!,'20,<50,s10,h,n~/.viminfo
endif
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc
set winaltkeys=no

let &winwidth=max([80, &columns/2 - 1])

if v:version >= 700
  let g:is_bash = 1
  let g:sh_noisk = 1
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh', 'sh']
  let g:liquid_highlight_types = g:markdown_fenced_languages + ['jinja=liquid', 'html+erb=eruby.html', 'html+jinja=liquid.html']
  let g:ragtag_global_maps = 1
  let g:surround_{char2nr('-')} = "<% \r %>"
  let g:surround_{char2nr('=')} = "<%= \r %>"
  let g:surround_{char2nr('8')} = "/* \r */"
  let g:surround_{char2nr('s')} = " \r"
  let g:surround_{char2nr('^')} = "/^\r$/"
  let g:surround_indent = 1
  let g:sql_type_default = "plsql"
  let g:solarized_diffmode = "high"
  let g:solarized_visibility = "low"
  let g:solarized_termcolors_blacks_reversed = 1
endif

nnoremap Y y$
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
endif
inoremap <C-C> <Esc>`^

vnoremap <M-<> <gv
vnoremap <M->> >gv
vnoremap <Space> I<Space><Esc>gv

inoremap <C-X>^ <C-R>=substitute(&commentstring,' \=%s\>'," -*- ".&ft." -*- vim:set ft=".&ft." ".(&et?"et":"noet")." sw=".&sw." sts=".&sts.':','')<CR>

noremap  <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

noremap  Q  <Nop>
inoremap jj <Esc>
vnoremap v  <Esc>

map <Up>        <Nop>
map <Down>      <Nop>
map <Left>      <Nop>
map <Right>     <Nop>
map <Home>      <Nop>
map <End>       <Nop>
map <PageUp>    <Nop>
map <PageDown>  <Nop>

imap <Up>       <Nop>
imap <Down>     <Nop>
imap <Left>     <Nop>
imap <Right>    <Nop>
imap <Home>     <Nop>
imap <End>      <Nop>
imap <PageUp>   <Nop>
imap <PageDown> <Nop>

if has("autocmd")
  filetype plugin indent on

  augroup Misc
    autocmd!
    autocmd SourcePre */macros/less.vim set laststatus=0 cmdheight=1
    autocmd BufNewFile */init.d/* set ft=sh
    autocmd BufWinEnter * silent! loadview
    autocmd BufWinLeave * silent! mkview
  augroup END

  augroup FTCheck
    autocmd!
    autocmd BufNewFile,BufRead *named.conf* set ft=named
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == "" | set ft=text | endif
    autocmd BufNewFile,BufRead *.pls,*.plsql,*.sql,*.trg,*.pkb,*.pks,*.fnc set ft=sql
    autocmd BufNewFile,BufRead *.md set ft=markdown
  augroup END

  augroup FTOptions
    autocmd!
    autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
    autocmd Syntax   javascript setlocal isk+=$
    autocmd FileType xml,xsd,xslt,javascript setlocal ts=2
    autocmd FileType text,txt,mail setlocal ai com=fb:*,fb:-,n:>
    autocmd FileType sh,zsh,csh,tcsh inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
    autocmd FileType sh,zsh,csh,tcsh let &l:path = substitute($PATH, ':', ',', 'g')
    autocmd FileType perl,python,ruby inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>
    autocmd FileType c,cpp,cs,java,perl,javscript,php,aspperl,tex,css let b:surround_101 = "\r\n}"
    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>
    autocmd FileType help setlocal ai fo+=2n
    autocmd FileType help nnoremap <silent><buffer> q :q<CR>
    autocmd FileType html setlocal iskeyword+=~
    autocmd FileType lua setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.lua'
    autocmd FileType ruby setlocal tw=79 comments=:#\  isfname+=:
    autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
    autocmd FileType tex setlocal formatoptions+=l
          \ | let b:surround_{char2nr('x')} = "\\texttt{\r}"
          \ | let b:surround_{char2nr('l')} = "\\\1identifier\1{\r}"
          \ | let b:surround_{char2nr('e')} = "\\begin{\1environment\1}\n\r\n\\end{\1\1}"
          \ | let b:surround_{char2nr('v')} = "\\verb|\r|"
          \ | let b:surround_{char2nr('V')} = "\\begin{verbatim}\n\r\n\\end{verbatim}"
    autocmd FileType vim setlocal keywordprg=:help
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  augroup END
endif

if (&t_Co > 2 || has("gui_running")) && has("syntax")
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

  if exists("syntax_on") || exists("syntax_manual")
  else
    syntax on
  endif

  set list
  set guioptions=a

  if has("gui_running") | set background=light | else | set background=dark | endif
  silent! colorscheme solarized

  augroup RCVisual
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

runtime! macros/matchit.vim
