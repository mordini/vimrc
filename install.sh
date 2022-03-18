## Link .vimrc
ln -s ~/vimrc ~/.vim && echo "source ~/vimrc/.vimrc" > ~/.vimrc

## install node version manager NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

## Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

## install latest node and lts
nvm install node
nvm install --lts

## install fd
sudo apt install fd-find

## Add fdfind to .bashrc
cat ./extraconfigs/fzf-fdfind >> ~/.bashrc

## install the silver searcher
sudo apt install silversearcher-ag

## install ripgrep
sudo apt install ripgrep

## Add ripgrep to fzf (only used for file finding I believe?  :Rg command works fine without this)
## cat ./extraconfigs/fzf-ripgrep >> ~/.bashrc

## setup for neovim
cp -r ./extraconfigs/nvim ~/.config/

## we need to resource .bashrc
source ~/.bashrc
