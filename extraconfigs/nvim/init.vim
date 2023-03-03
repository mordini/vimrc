lua require('basic')
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" is neovim is being run in vscode, share the init file
exists('g:vscode')
