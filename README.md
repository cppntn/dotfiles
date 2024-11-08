# MacOS Setup and dotfiles

1) Install command line tools on MacOS, and install Jetbrains Fonts. You can find them into `jetbrains_fonts`:

```
jetbrains_fonts
├── JetBrainsMonoNLNerdFont-Bold.ttf
├── JetBrainsMonoNLNerdFont-Italic.ttf
├── JetBrainsMonoNLNerdFont-Regular.ttf
└── JetBrainsMonoNLNerdFont-SemiBold.ttf
```

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
brew install fzf
brew install neovim
brew install tmux
brew install lua-language-server
brew install jq
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install hashicorp/tap/terraform-ls
brew install hashicorp/tap/packer
brew install terragrunt
brew install --cask spaceid
brew install mysql-client
brew install cargo
brew install rust
brew install redis
brew install p7zip
brew install orbstack
brew install kubectl
brew install helm
brew install derailed/k9s/k9s
brew install hcloud
brew install postgresql
brew install ariga/tap/atlas
brew install --cask dbeaver-community
```

Install `golang` from: https://go.dev/dl/
Then install the linter:

```bash
# go install golang.org/x/tools/gopls@latest
brew install gopls
```

Instal aws cli:

```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
```

4) Install ZSH and Oh My Zsh

```bash
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy custom .zshrc in /Users/antonio/.zshrc or set it up
vim ~/.zshrc
```

Create a symlink for the theme in the custom themes folder:

```bash
ln -s ~/dotfiles/custom/themes/sonicradish.zsh-theme ~/.oh-my-zsh/custom/themes/sonicradish.zsh-theme
```

You can put this into `.zshrc`:

```bash
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sonicradish"

plugins=(git kubectl terraform golang)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export TERM=xterm-256color
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/go/bin/go:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export SYSTEM_VERSION_COMPAT=1
export HOMEBREW_OPT="/opt/homebrew/opt"
export KUBECONFIG=$(find ~/.kube/configs -type f | tr '\n' ':')
export K9S_CONFIG_DIR="$HOME/.k9s"

alias ll='ls -alhp'
alias llt='ls -talhp'
alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias ts='tmux new -s'
alias tl='tmux list-sessions'
alias ssh='TERM=xterm-256color ssh'

alias dotfiles='cd $HOME/dotfiles'
nvim() {
    if [[ -d $1 ]]; then
        cd "$1" && command nvim +'lua require("nvim-tree.api").tree.open()'
    elif [[ -f $1 ]]; then
        command nvim "$1"
    elif [[ -z $1 ]]; then
        command nvim +'lua require("nvim-tree.api").tree.open()'
    else
        command nvim "$1"
    fi
}
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
```

5) Set dotfiles symlinks for tmux, nvim and alacritty

```bash
cd ~
git clone https://github.com/cppntn/dotfiles ~/dotfiles
mkdir -p .config/
mkdir -p .k9s/skins/
mkdir -p .ipython/profile_default
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py
ln -s ~/dotfiles/.k9s/skin.yaml ~/.k9s/skins/catppuccin.yaml
ln -s ~/dotfiles/.k9s/config.yaml ~/.k9s/config.yaml
```

6) Other useful stuff: 

```
# install magnet
# install Flycut
```
