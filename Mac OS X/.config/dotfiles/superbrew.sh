#!/bin/sh

echo "Cracking New Kegs"
brew update # Make sure we’re using the latest Homebrew

echo "Replacing Skunked Beverages with New Versions"
brew upgrade # Upgrade any already-installed formulae

echo "Brewing GNU Core Utilities" # Install GNU core utilities (those that come with OS X are outdated)
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH. if not already complete"
brew install coreutils                # Install GNU Core Utilities 
brew install moreutils                # Install GNU More Utilities 
brew install findutils 			    			# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install gnu-sed --default-names  # Install GNU  sed rather than OSX built in sed 
brew install bash 						      	# Install Bash 4
brew install wget --enable-iri 				# Install wget with IRI support
brew install tmux							        # Install multi termerminal support in a single frame

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
brew install ringojs 						      # Install latest version of RingoJS
brew install narwhal 					      	# Install Latest Narwhal

echo "Brewing recent versions of Tools for OSX" # Install more recent versions of some OS X tools
brew tap homebrew/dupes 					    # Tap the duplicate Formulas for Homebrew
brew install homebrew/dupes/grep 		  # Install Grep
brew tap josegonzalez/homebrew-php 		# Tap Homebrew-PHP
brew install php55 --with-gmp			    # Install Latest PHP (5.5)

echo "Brewing Native Apps" 					  # Install native apps
brew tap homebrew/versions 					  # Tap the versions Formulas for Homebrew
brew tap caskroom/versions            # Tap the versions Formulas for casks
# brew tap phinze/homebrew-cask 			# Tap the Cask formulas
brew install brew-cask 						    # Install the Brew-Cask commands (continued in the Function)

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

echo "Brewing Hacking/Cracking Binaries" 	# Install Hacking/cracking Binaries
brew install ncrack						        # Install NCrack Network Cracking Utility (Currently Broken)
brew install NMAP 							      # Install NMAP CLI
brew install John 				  		      # install John the Ripper password cracker CLI (Currently Broken)
brew install tor 						  	      # install Tor Network CLI
brew install pdfcrack 					      # Install a PDF Password Cracking utility
brew install elasticsearch			      # Install install ElasticSearch Distributed Search
brew install redis							      # install Redis Server (for Whitechappel and elasticsearch support)
brew install sshtrix						      # Install SSH Login Cracker (sshv1, v2)
brew install proxytunnel				      # Install CLI Proxy tunneling app
brew install msitools						      # Install MSI "Windoze" installer files
# brew install metasploit				      # Install the Metasploit Framework (Do not install local due to SEP hits)
brew install ettercap						      # Install the Ettercap "man in the middle" tool
brew install aircrack-ng				      # Install Air Sniffer
brew install absinthe						      # Install SQL Exploiter
brew install sqlmap                   # mapout SQL DBs

echo "Brewing Utility Binaries" 			# install Utility Binaries
brew install p7zip 							      # Install CLI Version of 7Zip
brew install osxfuse 						      # Install OSX Fuse drive compatability utility
brew install osxutils 					     	# Install MetaData and CLI Utilis for OSX
brew install homebrew/dupes/screen	  # Install the GNU Screen application for Full screen window manager
installcask the-unarchiver 					  # Install The Unarchiver app for OSX

echo "Brewing VM/Remote Access Binaries" 	# Install VM/Remote Access
installcask virtualbox 						    # Install Virtual Box x86 architecture Virtualization
brew install rdesktop						      # Install Remote Desktop (Windows) 

echo "Brewing PDF Manipulation Binaries" 	# Install PDF Manipulation Binaries
brew install pdf2htmlex 					    # Install Text PDF to HTML designer
# brew install pdftohtml 					   	# Install Standard PDF to HTML designer
# brew install pdf2image 				     	# Install PDF to Image App (Currently Broken)

echo "Brewing Web/Net Related Binaries" 	# install Web Related Binaries
brew install wget 					      		# Install wget downloader application
brew install webkit2png				    		# Install App to screenshot whole web pages, not just visable
brew install elinks 					      	# Install Kick Arse text based web browser
installcask transmission 					    # Install Transmission, a Bit torrent client for OSX
installcask tor-browser 				    	# Install A Tor Network compatable Browser for anonymoity
brew install wireshark					    	# Install Open SOurce Packet Analyzer
brew install tcptrace						      # Install CLI Utilities to analize TCP Dump trafic (shows "tracing" of connections)
brew install tcpreplay				    		# Install TCP Dump "edit/replay" Functionality
brew install tcpflow				      		# Install better CLI "tcpdump" utility
brew install openssl				      		# Install the Open Source SSL toolkit
# brew install midori

echo "Brewing Media Related Binaries" # install Web Related Binaries
brew install ffmpeg 				      		# Install FFMpeg, a CLI Media tool
brew install youtube-dl 		    			# Install a Youtube (and other) media downloader app
brew install imagemagick --with-webp	# Install a Photo Editing Package
brew install mplayer					       	# Install MPlayer a multi format video client
installcask vlc 						        	# Install one of the world's most popular Players/editors
installcask miro-video-converter 			# Install a video Converter
installcask imagealpha 				     		# Install a heavy compression package fore PNG Images
installcask imageoptim 				     		# Install an image optimized for faster loading speeds
brew install id3tool					       	# Install a CLI id3tool manipulation for tagging media

echo "Brewing General CLI Binaries"   # install General CLI Binaries
brew install tree 							      # Install a Visual (text) Directory Tree Displaying tool
brew install midnight-commander 			# Text based "OSX Finder" Looks like the original "Norton Commander"
brew install rename 						      # Install A better Rename command
brew install trash 							      # Install a Trash command to send filez from CLI to the trash in the finder
# brew install liquidprompt 			 		# Install an Awsome "prompt" for the terminal (completely configurable)
brew install keychain 				    		# Install a KeyChain application for SSH-SSL keys
brew install exiv2 					      		# Install an Image Meta Library and it's tools
brew install pigz 					       		# Install Paralell implementation of GZip (multicore-multiprocessor)
brew install ssh-copy-id		    			# Install SSH ID Copy to login to remote machines
brew install htop-osx				       		# Install OSX ascii "top" Application processes display

echo "Brewing Programing Languages/Utilities" # Install Programming Utils/Language Binaries
brew install gcc47 						       	# Gcc 4.7
brew install ruby 				      			# latest version of Ruby
brew install mysql 				       			# Latest MySQL DB App
brew install jruby				      			# Java Ruby 
brew install php-code-sniffer 				# PHP Code analyzer
brew install rhino 					      		# Rhino, Java Script Engine
brew install ack 						         	# Serch web for instances of text
brew install node 				      			# Node Code Optimiser for OSX
# brew install lua52 				     			# LUA version 5.2 language
brew install zopfli 			       			# re-compressor for GZip Archives (tighter Compression)
brew install python			      				# the Python Language (note the following commands are updaters)
brew install sysbench		       				# System Benchmarking CLI app
brew install msgpack		      				# Bianary serialization format to exchange data between different programing languages
# brew install git 				       			# powerful decentrilized revision control system
brew install git-extras      					# Additional stuff for Git
brew install hub					         		# Hub a commandline wrapper for Github
brew install postgres --no-python 		# Postgres, a good open source relational database
brew install redis 						       	# Redis, a good key-value database
brew install the_silver_searcher 			# The Silver Searcher (better than ack or grep) to search the contents of files
brew install ctags 							      # ctags, to index files for vim tab completion of methods, classes, variables
brew install tmux 						      	# tmux, to save project state and switch between projects
brew install reattach-to-user-namespace # reattach-to-user-namespace, for copy-paste and RubyMotion compatibility with tmux
brew install qt 							        # QT, used by Capybara Webkit for headless Javascript integration testing
brew install watch 							      # watch, to execute a program periodically and show the output
brew install rbenv-gem-rehash 				# rbenv-gem-rehash so the shell automatically picks up binaries after installing gems with binaries
brew install ruby-build 					    # ruby-build, to install Rubies
brew tap homebrew/dupes 					    # GNU Compiler Collection, a necessary prerequisite to installing Ruby
brew install apple-gcc42					    # Cont. From Above
export CC=gcc-4.2
brew install openssl 						      # Upgrading and linking OpenSSL

# Adding Ruby Environment
RUBY_VERSION="2.1.0"

echo "Installing Ruby $RUBY_VERSION ..."
  rbenv install $RUBY_VERSION

echo "Setting $RUBY_VERSION as global default Ruby ..."
  rbenv global $RUBY_VERSION
  rbenv rehash

echo "Updating to latest Rubygems version ..."
  gem update --system

echo "Installing Bundler to install project-specific Ruby gems ..."
  gem install bundler --no-document --pre

echo "Installing GitHub CLI client ..."
  curl http://hub.github.com/standalone -sLo ~/.bin/hub
  chmod +x ~/.bin/hub

echo "Configuring Bundler for faster, parallel gem installation ..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))

echo "Installing Rails ..."
  gem install rails --no-document

brew install heroku-toolkit					  # Heroku CLI Client
heroku plugins:install git://github.com/ddollar/heroku-config.git # heroku-config plugin to pull config variables locally to be used as ENV variables

echo "Installing rcm, to manage your dotfiles ..."
  brew tap thoughtbot/formulae
  brew install rcm


pip install --upgrade setuptools
pip install --upgrade pip

echo "Brewing Text Editing/Manipulation Binaries" #install Editing Binaries
brew install vim 							        # Install the latest VIM CLI Editor
installcask macvim 							      # Install the MacVIM GUI Command line editor based on VIM CLI
brew install ttyrec							      # Install a CLI recorder for Terminal 9ttyrec-ttyplay commands)

echo "Mopping up the old and broken Beverages" # Remove outdated versions from the cellar
brew linkapps
brew cleanup

echo "Here are all the bottles and Kegs installed in your cellar"
brew list