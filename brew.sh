#!/bin/bash
#Install command-line tools using Homebrew.  

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install macvim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install Basic Development Application(s)

brew install tree
brew install nvm
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install imagemagick --with-webp
brew install lynx
brew install p7zip
brew install pigz
brew install rename
brew install ssh-copy-id
brew install pow
brew install speedtest-cli
brew install youtube-dl

# Java Development Stack
brew cask install --appdir="/Applications" java
brew install scala
brew install sbt


# Cask Basic Applications
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" xquartz
brew cask install --appdir="/Applications" keka

# Cask Dev Tools
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" brackets
brew cask install --appdir="/Applications" macdown

# Cask Essential Tools
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" amazon-cloud-drive
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" quip
brew cask install --appdir="/Applications" jdownloader
brew cask install --appdir="/Applications" kindle
brew cask install --appdir="/Applications" tunnelblick
brew cask install --appdir="/Applications" bittorrent-sync 

# Install Required Fonts
brew tap caskroom/fonts
brew cask install 'font-hack'
brew cask install 'font-inconsolata-for-powerline'
brew cask install 'font-inconsolata-g-for-powerline'

# Link cask apps to Alfred
brew cask alfred link

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

