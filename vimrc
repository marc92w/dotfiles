" Marc Weise
" Organization based on dougblackio's .vimrc (http://dougblack.io/words/a-good-vimrc.html)

set nocompatible                                          " choose no compatibility with legacy vi
set encoding=utf-8

" Colors
colorscheme monokai
syntax enable

" Line Length
call matchadd('ColorColumn', '\%101v', 100)
set tw=100

" Whitespace (Tabs & Spaces)
set nowrap                                                " don't wrap lines
set tabstop=2 shiftwidth=2                                " a tab is two spaces
set expandtab                                             " use spaces, instead of tabs

" Indentation
set backspace=indent,eol,start                            " backspace through everything in INSERT
set autoindent                                            " indent automatically
let g:indent_guides_enable_on_vim_startup=1
let indent_guides_auto_colors=0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=237
nnoremap <F2> :set invpaste paste?<CR>                    " use F2 to toogle paste mode
set pastetoggle=<F2>

" UI Layout
set number                                                " show line numbers
set showmode
set showcmd                                               " show command in bottom bar 
filetype plugin indent on                                 " load file type plugins + indentation
set wildmenu                                              " visual autocomplete for command menu
set ruler

" Statusline
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

inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>   " handle exiting insert mode via control-C

hi statusline ctermbg=148                                 " default background of statusline green
hi statusline ctermfg=235

" have a permanent statusline to color
set laststatus=2

" Searching
set incsearch                                             " Search as characters are entered
set hlsearch                                              " highlight matches
set ignorecase                                            " search is case insensitive...
set smartcase                                             " ... unless it contains a capital letter
nnoremap \ :noh<CR>                                       " turn of search highlight

" Folding
set foldenable                                            " enable folding
set foldlevelstart=10                                     " open most folds by default
set foldnestmax=10                                        " 10 nested fold maximum
set modelines=1

" Movement
set scrolloff=10                                          " show at least 10 rows above and below
noremap <Up> <nop>                                        " disable arrow keys
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Leader Shortcuts
let mapleader=","                                         " leader is comma

" Custom functions
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" Prominent Mode Indication 
function! InsertStatuslineColor(mode)
  if a:mode == 'i'                                        " Insert Mode 
    hi statusline ctermbg=197
  elseif a:mode == 'r'                                    " Replace Mode 
    hi statusline ctermbg=81
  else
    hi statusline ctermbg=141
  endif
endfunction

function! InsertLeaveActions()
  hi statusline ctermbg=148
  hi statusline ctermfg=235
endfunction

" vim:foldmethod=marker:foldlevel=0
