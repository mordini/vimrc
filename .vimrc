" CoC configuration
" source ~/vimrc/extraconfigs/coc/coc.vim
source ~/vimrc/keybinds.vim

set nocompatible
set number "show line numbers
set tabstop=2
set shiftwidth=2
syntax on "enable syntax highlighting
let g:vue_pre_processors = [] "No preprocessors for vue highlighting
set expandtab "Use spaces when tabbing
set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search
filetype plugin indent on

" fzf use Ag to respect .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Enable vim-javascript
syntax enable

" Enable javascript-libraries-syntax for Vue
let g:used_javascript_libs = 'vue'

" enable prettier
packloadall
" make prettier format on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Uncomment if you wish to have the .vimrc settings purely control prettier
"let g:prettier#config#config_precedence = 'file-override'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

inoremap <Down> <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    :res -1 <CR>
noremap  <Down>  :res +1 <CR>
noremap  <Left>  :vertical resize -1<CR>
noremap  <Right> :vertical resize +1<CR>

" buffer switcher
noremap <Leader>b :ls<CR>:b
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

" Configure slime for tmux
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

call plug#begin()
" React Stuff
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

"Plug 'jpalardy/vim-slime'
Plug 'flazz/vim-colorschemes' "A bunch of colorschemes
Plug 'Mofiqul/vscode.nvim' "vscode dark/light scheme

"Begin Set up vim like an IDE
Plug 'posva/vim-vue' " Vuejs highlighting
Plug 'jelera/vim-javascript-syntax' "Enhanced JavaScript Syntax for Vim
Plug 'othree/javascript-libraries-syntax.vim' " Syntax file for JavaScript libraries
Plug 'aserebryakov/vim-todo-lists' " Todo list management
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install'  }

Plug 'jiangmiao/auto-pairs' "close quotes, brackets, etc etc
Plug 'alvan/vim-closetag' "automatically close (x)html tags
Plug 'tpope/vim-surround' "change matching "surrounds" like <b> </b> using "csX" (change.surround.X)
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim' " Comment stuff out
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'dyng/ctrlsf.vim' "Enables asynchronously searching the file system. 
" Plug 'ervandew/supertab'
Plug 'PhilRunninger/nerdtree-visual-selection'
" fuzzy finder, let's try this instead of nerdtree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "Conquer of Completion (code completion)
"End Set up vim like an IDE
call plug#end()

" Install missing plugins on Vim startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

set t_Co=256

" VSCODE THEMES
" For dark theme
let g:vscode_style = "dark"
" For light theme
" let g:vscode_style = "light"
" Enable transparent background
let g:vscode_transparency = 1
" " Enable italic comment
let g:vscode_italic_comment = 1
" Disable nvim-tree background color
let g:vscode_disable_nvimtree_bg = v:true
colorscheme vscode
" colorscheme calmar256-light

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd>
  "< https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
