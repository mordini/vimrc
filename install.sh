## Link .vimrc
ln -s ~/.vimrc ~/.vim && echo "source ~/.vimrc/.vimrc" > ~/.vimrc

## install fd
sudo apt install fd-find

## Add fdfind to .bashrc
cat ./extraconfigs/fzf-fdfind >> ~/.bashrc

## install the silver searcher
## sudo apt install silversearcher-ag

## Add ripgrep to fzf
## cat ./extraconfigs/fzf-ripgrep >> ~/.bashrc

## setup for neovim
cp -r ./extraconfigs/nvim ~/.config/

## we need to resource .bashrc
source ~/.bashrc
