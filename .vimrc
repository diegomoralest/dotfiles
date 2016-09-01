execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
map <F7> mzgg=G`z
map <F6> mzggvG$"+y`z
map ñ <PageDown>
map Ñ <PageUp>
imap jj <Esc>
set pastetoggle=<F2>
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif
if !has('gui_running')
  colorscheme sol-term
  highlight Normal ctermfg=black ctermbg=white
endif
if has('gui_running')
  colorscheme sol
  set guifont=DejaVu\ Sans\ Mono\ 11
  set lines=40 columns=140
endif
