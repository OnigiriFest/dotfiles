call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf'
	Plug 'noahfrederick/vim-noctu'
	Plug 'Rigellute/shades-of-purple.vim'
	Plug 'mattn/emmet-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
	Plug 'alvan/vim-closetag'
	Plug 'yggdroot/indentline'
	Plug 'jiangmiao/auto-pairs'
	Plug 'othree/html5.vim'
	Plug 'dylanaraps/wal.vim'
call plug#end()

set number relativenumber
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

" Enable the theme
colorscheme wal

map <C-n> :NERDTreeToggle<CR>

" fzf fuzzy search
set rtp+=/usr/bin/fzf
map <C-p> :FZF<CR>

" Copy between programs
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+"

" New lines withtout insert mode
map <C-o> O<Esc>
map <CR> o<Esc>

" Split screen
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Move Between Tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabprevious<CR>

" CoC Recommended config with somethings less

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CoC Config END
