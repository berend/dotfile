# brew initial setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# brew stuff
brew install git
brew install coreutils
brew install jq
brew install pyenv
brew install pyenv-virtualenv
brew install zsh
brew install node

# cask stuff
brew cask install pycharm
brew cask install spotify
brew cask install spectales
brew cask install sublime-text
brew cask install telegram-desktop
brew cask install iterm2
brew cask install macdown
brew cask install google-chrome
brew cask install p4merge
brew cask install gpgtools

# remove unused stuff after all those installs
brew cleanup

# install common python version
pyenv install 3.6.1
pyenv install 2.7.13

# zsh setup
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


# change some apple internals

# ask for password after lock immediately
defaults write com.apple.screensaver 'askForPassword' -int 1
defaults write com.apple.screensaver 'askForPasswordDelay' -int 0