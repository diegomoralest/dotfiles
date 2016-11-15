execute pathogen#infect()
syntax on
filetype plugin indent on
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
let g:syntastic_check_on_open=1
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" --- Location list syntastic ---
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction
let g:jedi#goto_command = "<leader>n"
let g:jedi#use_tabs_not_buffers = 1
let mapleader= ","
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>z :<C-u>call ToggleErrors()<CR>
nnoremap <leader>f mzgg=G`z
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>W :w!<CR>
nnoremap <leader>X :x!<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>pp "+pp
nnoremap <leader>0 "0p
nnoremap <leader>1 "1p
nnoremap <leader>2 "2p
nnoremap <leader>3 "3p
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>
nnoremap <leader>e <C-u>
nnoremap <leader>fm :TabVifm<CR>
nnoremap <leader>ts :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"---Autocompletion menu jedi---
let g:jedi#auto_initialization = 0
autocmd FileType python let g:jedi#auto_initialization = 1
autocmd FileType py let g:jedi#auto_initialization = 1
inoremap <expr> <D-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <D-k> ((pumvisible())?("\<C-p>"):("k"))

"---Outline using CTags
nmap <F12> :TagbarToggle<CR>
map <C-p> [unite]p

"---Tab navigation
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
nnoremap tk :tabn<CR>
nnoremap tj :tabp<CR>
nnoremap t0 :tabfirst<CR>
nnoremap t$ :tablast<CR>
nnoremap <leader>tj :execute 'tabmove ' . (tabpagenr()-2)<CR>
nnoremap <leader>tk :execute 'tabmove ' . (tabpagenr()+1)<CR>
au TabLeave * let g:lasttab = tabpagenr()

"---Window switcher
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

"---Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:neocomplete#enable_at_startup = 1
let g:rooter_patterns = ['pom.xml', '.git/']
let g:syntastic_java_javac_config_file_enabled=1

"--Cscope

nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <leader>ghs :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ghg :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ghc :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ght :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ghe :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ghf :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ghi :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>ghd :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <leader>gvs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gvg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gvc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gvt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gvf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gvi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>gvd :vert scs find d <C-R>=expand("<cword>")<CR><CR>
