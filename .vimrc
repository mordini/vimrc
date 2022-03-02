set nocompatible
set number "show line numbers
set tabstop=2
set shiftwidth=2
syntax on "enable syntax highlighting
set expandtab "Use spaces when tabbing
set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search
filetype plugin indent on

" Set up COC for vanilla vim
set hidden
set updatetime=300
set shortmess=aFc

inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
noremap <Leader>b :ls<CR>:b " buffer switcher
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CTRL + P view file list
" Use Ctrl + e to view the current buffer, and use Ctrl + e twice to quickly switch the last opened buffer
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" https://rietta.com/blog/hide-gitignored-files-fzf-vim/
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

call plug#begin()
Plug 'flazz/vim-colorschemes' "A bunch of colorschemes
"Begin Set up vim like an IDE
Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim.
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs' "close quotes, brackets, etc etc
Plug 'alvan/vim-closetag' "automatically close (x)html tags
Plug 'tpope/vim-surround' "change matching "surrounds" like <b> </b> using "csX" (change.surround.X)
Plug 'tomtom/tcomment_vim' " Comment stuff out
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'dyng/ctrlsf.vim' "Enables asynchronously searching the file system. 
Plug 'ervandew/supertab'
Plug 'PhilRunninger/nerdtree-visual-selection'
" fuzzy finder, let's try this instead of nerdtree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Conquer of Completion (code completion)
"End Set up vim like an IDE
call plug#end()

set t_Co=256
"colorscheme Tomorrow-Night-Bright
colorscheme simple_dark 


" START SETTINGS FOR VIM-CLOSETAG
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.vue'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml, *.vue'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx, *.vue'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" END SETTINGS FOR VIM-CLOSETAG
