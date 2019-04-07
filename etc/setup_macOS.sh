#!/bin/sh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Inatall Hombrew Cask
brew tap caskroom/cask

# Install development tools
brew install zsh git wget tree jq

# Install development apps
brew cask install visual-studio-code docker google-chrome karabiner-elements

# Install Caskroom-fonts
brew tap caskroom/fonts

# Install development fonts
brew cask install font-ricty-diminished

# Karabinar settings
if [ -f "${HOME}/.config/karabiner/karabiner.json" ]; then
  cp "${DOTFILES_DIR}/others/karabiner.json" "${HOME}/.config/karabiner/karabiner.json"
fi


# Add shell to /etc/shells
if [ ! "`cat /etc/shells | grep /usr/local/bin/zsh`" ]; then
    echo /usr/local/bin/zsh | sudo tee -a /etc/shells
fi

# Change shell to zsh
chsh -s /usr/local/bin/zsh
echo 'Please restart terminal'
