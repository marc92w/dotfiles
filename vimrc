" Author: Marc Weise (marc92w@yahoo.de)
" File structure based on dougblackio's .vimrc (http://dougblack.io/words/a-good-vimrc.html)

" Pathogen Plugin {{{
execute pathogen#infect()
" }}}

" General {{{
set nocompatible                                          " choose no compatibility with legacy vi
set encoding=utf-8
" }}}

" Language {{{
set langmenu=en                                             " sets language of menu (gvim)
let $LANG = 'en'
" }}}

" User Interface (GVIM) {{{
if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h12:cANSI                          " set up the font for gVim in windows
  endif

  set guioptions-=m                                         " hide menu bar (gvim)
  set guioptions-=T                                         " hide toolbar (gvim)
  set guioptions-=r                                         " hide right-hand scroll bar
  set guioptions-=L                                         " hide left-hand scroll bar

  set visualbell                                            " flash window instead of beep
endif
" }}}

" Colors {{{
colorscheme monokai
syntax enable
" }}}

" Line Length {{{
call matchadd('ColorColumn', '\%101v', 100)
set tw=100
" }}}

" Whitespace (Tabs & Spaces) {{{
set nowrap                                                " don't wrap lines
set tabstop=2 shiftwidth=2                                " a tab is two spaces
set expandtab                                             " use spaces, instead of tabs
" }}}

" Indentation {{{
set backspace=indent,eol,start                            " backspace through everything in INSERT
set autoindent                                            " indent automatically
let g:indent_guides_enable_on_vim_startup=1
let indent_guides_auto_colors=0
hi IndentGuidesOdd  ctermbg=236 guibg=#31322c
hi IndentGuidesEven ctermbg=237 guibg=#3c3d37

" use F2 to toogle paste mode
nnoremap <F2> :set invpaste paste?<CR> 
set pastetoggle=<F2>
" }}}

" UI Layout {{{
set lines=70 columns=105                                  " Initial window size
set number                                                " show line numbers
set showmode
set showcmd                                               " show command in bottom bar 
filetype plugin indent on                                 " load file type plugins + indentation
set wildmenu                                              " visual autocomplete for command menu
set ruler
" }}}

" Statusline {{{
set laststatus=2                                          " always show a statusline
set statusline=
set statusline+=\[%n]                                     " number of current buffer
set statusline+=\ \ %m%r%w\                               " file modified? Readonly?
set statusline+=\ %<%F\                                   " path of the opened file
set statusline+=\ %y\                                     " file type
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}         " file encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}[%{&ff}]\       " BOM and FileFormat (dos/unix..) 
set statusline+=\ %{&spelllang}\ %{HighlightSearch()}\    " spellanguage & Highlight on?
set statusline+=\ %{(&paste?\",PASTE\":\"\")}             " in paste mode?
set statusline+=\ %=\%P\ %l/%L:\                          " Rownumber/total (%)
set statusline+=\ %c\                                     " column number

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" handle exiting insert mode via control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default background of statusline green
hi statusline ctermbg=148 guibg=#a6e22e
hi statusline ctermfg=235 guifg=#272822

set laststatus=2                                          " have a permanent statusline to color
" }}}

" Searching {{{
set incsearch                                             " Search as characters are entered
set hlsearch                                              " highlight matches
set ignorecase                                            " search is case insensitive...
set smartcase                                             " ... unless it contains a capital letter
nnoremap \ :noh<CR>                                       " turn of search highlight
" }}}

" Folding {{{
set foldenable                                            " enable folding
set foldlevelstart=10                                     " open most folds by default
set foldnestmax=10                                        " 10 nested fold maximum
set modelines=1
" }}}

" Movement {{{
set scrolloff=10                                          " show at least 10 rows above and below
noremap <Up> <nop>                                        " disable arrow keys
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" }}}

" Leader Shortcuts {{{
let mapleader=","                                         " leader is comma
" }}}

" Ctrlp.vim {{{
set runtimepath^=~/vimfiles/bundle/ctrlp.vim
" }}}

" Custom functions {{{
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

function! InsertStatuslineColor(mode)                     " Prominent Mode Indication 
  if a:mode == 'i'                                        " when in insert mode
    hi statusline ctermbg=197 guibg=#f92672
  elseif a:mode == 'r'                                    " when in replace mode
    hi statusline ctermbg=81 guibg=#66d9ef
  else
    hi statusline ctermbg=141 guibg=#ae81ff
  endif
endfunction

function! InsertLeaveActions()
  hi statusline ctermbg=148 guibg=#a6e22e
  hi statusline ctermfg=235 guifg=#272822
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
