set cursorline
set wrap
set number
set nocompatible
set backspace=indent,eol,start
set autoindent
set smarttab
set nobackup
set history=500
set ruler
set showcmd
set incsearch
set showbreak=\
set cmdheight=2
set so=10
set visualbell
set wildmenu
set digraph
set equalalways
set nobackup
set splitbelow
set hidden
set ignorecase
set noeb
set autowrite
set ek  noet nosol
set fo=cqrt
set shm=at
set ww=<,>,h,l
set comments=b:#,:%,n:>
"set list listchars=tab:»·,trail:·
set su=.bak,~,.o,.h,.info,.swp,.obj,.dvi,.pdf,.log,.aux,.exe,.tar,.gz,.zip,.bz2,.exe
set expandtab
set sw=3
set stal=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set gcr=a:blinkon0 "Curseur ne clignote pas"


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")


"Mappings
map Q gq
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F7> :ls<CR>
map <F8> :bd<CR>
map j gj
map k gk
map <UP> gk
map <DOWN> gj
map <HOME> :exe 'normal' (&wrap?'g0':'0')<CR>
map <END> :exe 'normal' (&wrap?'g$':'$')<CR>

map <F1> :se hlsearch!<CR>
map <F2> :se wrap!<CR>
map <F3> :set cursorline!<CR>

"map <f9> macro:w<cr>:n<cr><f9>
map <F12> :Explore<CR>

" tab navigation like firefox

map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>

"imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabprevious<cr>i

nmap <C-t> <ESC>:tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>i

map :enew :tabnew


vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
           \ if line("'\"") > 0 && line("'\"") <= line("$") |
           \   exe "normal g`\"" |
           \ endif

endif " has("autocmd")

" MS Windows Behavior shortcuts
source $VIMRUNTIME\mswin.vim
behave mswin


" Auto Commands
" Placing Vim into the directory where the file is.
autocmd VimEnter,BufNewFile,BufRead,BufEnter * if strlen (@%) !=0 | cd %:p:h | endif
au VimEnter,BufNewFile,BufRead,BufEnter *.sql set ft=plsql
" Quand on fait de la programmation, on veut qu'il n'y ait jamais de
" vraies tabulations insérées mais seulement 4 espaces
autocmd VimEnter,BufNewFile,BufRead,BufEnter *.java set expandtab
autocmd VimEnter,BufNewFile,BufRead,BufEnter *.java set sw=3
autocmd VimEnter,BufNewFile,BufRead,BufEnter *.html set expandtab
autocmd VimEnter,BufNewFile,BufRead,BufEnter *.html set sw=3
autocmd VimEnter,BufNewFile,BufRead,BufEnter *.php set expandtab
autocmd VimEnter,BufNewFile,BufRead,BufEnter *.php set sw=3


" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin *.bqy let &bin=1
  au BufReadPost *.bin *.bqy if &bin | %!xxd
  au BufReadPost *.bin *.bqy set ft=xxd | endif
  au BufWritePre *.bin *.bqy if &bin | %!xxd -r
  au BufWritePre *.bin *.bqy endif
  au BufWritePost *.bin *.bqy if &bin | %!xxd
  au BufWritePost *.bin *.bqy set nomod | endif
augroup END


hi cursor guibg=green guifg=black
hi cursorline guibg=yellow
hi linenr guibg=lightgrey guifg=brown
hi hisearch guibg=cyan
hi search guibg=cyan guifg=black
set guioptions=egmrLtT

set noswapfile
