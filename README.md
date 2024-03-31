# MacOS Setup and dotfiles

1) Install command line tools on MacOS

2) Install alacritty

```bash
brew install --cask alacritty
defaults write org.alacritty AppleFontSmoothing -int 0
```

3) Install brew and other needed packages

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install grep
brew install python@3.11
pip install pyright black
brew install wget
brew install htop
brew install ripgrep
brew install neovim
brew install tmux
brew install lua-language-server
brew install jq
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

4) Install ZSH and Oh My Zsh

```bash
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy custom .zshrc in /Users/antonio/.zshrc or set it up
vim ~/.zshrc
```

5) Set dotfiles symlinks for tmux, nvim and alacritty

```bash
cd ~
git clone https://github.com/cppntn/dotfiles ~/dotfiles
mkdir -p .config/
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
```

6) Other useful stuff: 

```
# install magnet
# install Flycut
# install orbstack
```
