set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number                      " show line numbers
set ruler

"" Coding style
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/
set tw=100

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, instead of tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent                  " indent automatically

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Scrolling
set scrolloff=10

"" Colorscheme
colors monokai

"" indentation guides
let g:indent_guides_enable_on_vim_startup=1
let indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=237

"" Statusline configuration
"" ------------------------------
"" Always show a statusline
set laststatus=2

"" Configure contents
set statusline=
set statusline+=\[%n]                                  "buffernr
set statusline+=\ %<%F\                                "File+path
set statusline+=\ %y\                                  "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=\ %{&spelllang}\ %{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=\ col:%03c\                            "Colnr
set statusline+=\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
  if a:mode == 'i'                    " Insert Mode when pressing 'i'
    hi statusline ctermbg=197
  elseif a:mode == 'r'                " Replace Mode when pressing 'R'
    hi statusline ctermbg=81
  else
    hi statusline ctermbg=141
  endif
endfunction

function! InsertLeaveActions()
  hi statusline ctermbg=148
  hi statusline ctermfg=black
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline to green when entering Vim
hi statusline ctermbg=148
hi statusline ctermfg=black

" have a permanent statusline to color
set laststatus=2

" to avoid problems with indent during pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

