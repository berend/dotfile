/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
brew install git
brew install coreutils
brew cask install pycharm
brew cask install spotify
brew cask install spectales
brew cask install sublime-text
brew cask install telegram-desktop
brew cask install iterm2
brew cask install macdown
brew cask install google-chrome
brew cask install p4merge

brew install pyenv
brew install pyenv-virtualenv
brew install zsh
pyenv install 3.6.1
pyenv install 2.7.13

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

brew cleanup