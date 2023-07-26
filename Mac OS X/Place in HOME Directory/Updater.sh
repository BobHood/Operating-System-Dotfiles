#!/bin/sh
echo "Updating Apple Software"
sudo softwareupdate -i -a --verbose
echo "Checking Homebrew for Fresh Bottles and Kegs"
# brew bundle dump --describe #Must have been run previously for the next command to work.
brew bundle -v
echo "Cleaning up Brew's Mess"
brew cleanup
echo "Having the Doctor check us out in case of Hangover"
brew doctor -v