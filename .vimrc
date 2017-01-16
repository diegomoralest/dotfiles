" deps: ripgrep silversearcher ack fzf
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
"-- Tern completer for js, clang completer for other
"-- deps: cmake
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
Plug 'airblade/vim-rooter'
Plug 'bkad/CamelCaseMotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ensime/ensime-vim'
Plug 'fboender/bexec'
Plug 'hynek/vim-python-pep8-indent'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-sensible'
Plug 'vifm/vifm.vim'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-pyref'
call plug#end()

syntax on
filetype plugin indent on
set autoindent
set smartindent

set pastetoggle=<F2>
if has('mouse')
	set mouse=a
	set ttymouse=xterm2
endif

if !has('gui_running')
	colorscheme sol-term
	highlight Normal ctermfg=black ctermbg=white
endif

highlight ColorColumn ctermbg=gray
set colorcolumn=80

if &filetype == 'java' || &filetype == 'javascript' 
	set colorcolumn=120
endif

set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

let mapleader= ","

map <F7> mzgg=G`z
map <F6> mzggvG$"+y`z
map ñ <PageDown>
map Ñ <PageUp>
imap jj <Esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>z :<C-u>call ToggleErrors()<CR>
nnoremap <leader>f mzgg=G`z
nnoremap <leader>w :w<CR>
nnoremap <leader>Wa :wa<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Xa :xa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Qa :qa<CR>
nnoremap <leader>W :w!<CR>
nnoremap <leader>X :x!<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>pp "+pp
nnoremap <leader>0 "0p
nnoremap <leader>1 "1p
nnoremap <leader>2 "2p
nnoremap <leader>3 "3p
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>0 "0p
vnoremap <leader>1 "1p
vnoremap <leader>2 "2p
vnoremap <leader>3 "3p
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>
nnoremap <leader>e <C-u>
nnoremap <leader>r <C-r>
nnoremap <leader>fm :TabVifm<CR>
nnoremap <leader>ba :Buffers<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>fr :Files<CR>
nnoremap fr :call ExecuteFiles()<CR>
vnoremap fr :call VExecuteFiles()<CR>
nnoremap <Leader>fa :Ag<Space>
nmap fa :call ExecuteAg()<CR>
vnoremap fa :call VExecuteAg()<CR>
nnoremap <leader>ts :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

fu! ExecuteAg()
	let l:Text = expand("<cword>")
	execute "Ag! " . l:Text
endfu 


fu! VExecuteAg()
	let l:Text = @" 
	execute "Ag! " . l:Text
endfu 

fu! ExecuteFiles()
	let l:Text = expand("<cword>")
	execute "Find " . l:Text
endfu 

fu! VExecuteFiles()
	let l:Text = @" 
	execute "Find " . l:Text
endfu 

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

"---Javascript
let g:syntastic_javascript_checkers = ['eslint']

"---Python
let g:syntastic_python_checkers = ['flake8']

"---Assorted confs
let g:vimshell_editor_command = '/usr/local/bin/mvim'
let bexec_splitdir = 'ver'
let g:ackhighlight = 0
let g:pyref_mapping = 'K'

cnoreabbrev Ack Ack!

let g:ack_qhandler = "vertical copen 50"
let g:ack_lhandler = "vertical lopen 50"

" Ensime
autocmd BufWritePost *.scala silent :EnTypeCheck
autocmd BufWritePost *.java silent :EnTypeCheck

" -- Easy Type Inspection
nnoremap <localleader>t :EnTypeCheck<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> <leader>iw <Plug>CamelCaseMotion_iw
xmap <silent> <leader>iw <Plug>CamelCaseMotion_iw
omap <silent> <leader>ib <Plug>CamelCaseMotion_ib
xmap <silent> <leader>ib <Plug>CamelCaseMotion_ib
omap <silent> <leader>ie <Plug>CamelCaseMotion_ie
xmap <silent> <leader>ie <Plug>CamelCaseMotion_ie
