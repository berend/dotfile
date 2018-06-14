# brew initial setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# brew stuff
brew install git
brew install coreutils
brew install jq
brew install zsh
brew install node
brew install python@3
brew install python@2
brew install hub

# cask stuff
brew cask install pycharm
brew cask install spotify
brew cask install spectacle
brew cask install sublime-text
brew cask install telegram-desktop
brew cask install iterm2
brew cask install macdown
brew cask install google-chrome
brew cask install p4merge
brew cask install gpgtools

# remove unused stuff after all those installs
brew cleanup

# setup virtualenvwrapper
pip install virtualenvwrapper


# zsh setup
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


# change some osx defaults

# ask for password after lock immediately
defaults write com.apple.screensaver 'askForPassword' -int 1
defaults write com.apple.screensaver 'askForPasswordDelay' -int 0

# finder stuff
defaults write com.apple.Finder AppleShowAllFiles YES
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true

# fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# keyboard shortcut cmd + < for Move focues to next window within same application
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 27 "{enabled = 1; value = { parameters = (60, 50, 1048576); type = 'standard'; }; }"

# natual scrolling off
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# git configs
git config --global core.editor "subl -n -w"
git config --global merge.ff false
git config --global user.name "Berend Kapelle"
git config --global push.followTags true
git config --global pull.rebase true
git config --global commit.gpgsign true
git config --global core.excludesfile '~/.gitignore'


mkdir -p "~/workspace/own"
cp env.sh ~/
cp .zshrc ~/
