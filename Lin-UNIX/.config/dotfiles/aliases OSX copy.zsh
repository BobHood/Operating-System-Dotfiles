#!/bin/sh
########################################################################
####                 .zsh Shell Path variables                      ####
########################################################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# You can think of an alias as a shortcut for a command you execute!
#
# Now, there is a variety of ways by which you can configure and use aliases on ZSH and in this tutorial, I will be covering the following types:
#
# Simple aliases (to replace long command with short name)
# Suffix aliases (to execute a specific type of file with the desired tool)
# Global aliases (can be used by every user on the system)
# Function aliases (useful when you want to add parameters with multiple commands)
# It may sound a bit complex but don't worry; it only takes a couple of commands to configure and improve your productivity like never before.
#
# This is my Mac Aliases shell file. my .zhsrc will source this file to pull them all in.

########################################################################
####                 Change Directory Aliases                       ####
########################################################################
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
cd() { builtin cd "$@"; exa -lh; }          # Always list directory contents upon 'cd'

########################################################################
####            Directory listing commands (ls=> exa)               ####
########################################################################
alias ls="exa"                              # Subing exa for ls 
alias ll="exa -lh"                          # shortened ls -list with header
alias la="exa -lah"                         # Shorted ls -lalist all and hidden with Header
alias tree="exa --tree"                     # EXA Tree command vs the traditional Tree (either --tree or -T)
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
                                            # lr: Full Recursive Directory Listing

########################################################################
####                Direct Directory Navigation                     ####
########################################################################
alias ~="cd ~"						        # Go to Home
alias drop="cd ~/Dropbox"                   # Go to Dropbox Directory (If exists)
alias dload="cd ~/Downloads"                # Jump to the Mac Downloads Directory
alias dt="cd ~/Desktop"                     # Jump to the Mac Desktop
alias gdrive="cd ~/Google/ Drive"           # Jump to the Google drive Shortcut directory
alias sshdir="cd ~/.ssh"                    # Jump to the .ssh directory in my User Directory

########################################################################
####                     Command Shortcuts                          ####
########################################################################
alias cat='bat'                             # Switch Cat command to Bat for functionality improvement
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias md="mkdir "                           # Shortened Make Directory command
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
alias which='type -all'                     # which: Find executables
alias path='echo -e ${PATH//:/\\n}'         # path: Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty: Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic: Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash: Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql: Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT: Pipe content to file on MacOS Desktop
alias cls=clear                             # Shorten the Clear Command and make it more familiar
alias h="history"                           # shorten the History command
alias j="jobs"                              # Shorten the Jobs command
alias grep='grep --color=auto'              # Colorize the grep command output for ease of use (good for log files)
alias egrep='egrep --color=auto'            # Colorize the grep command output for ease of use (good for log files)
alias fgrep='fgrep --color=auto'            # Colorize the grep command output for ease of use (good for log files)
alias code="codium"                         # to help remember the move from VSCode to Codium
alias -s {txt,md,yaml,yml}="codium"         # Auto open a new file within Codium using the name given on the prompt,
# ex : >ReadMe.txt would open Codium with the new file ReadMe.txt
alias pg="echo 'Pinging Google' && ping www.google.com"
                                            # Ping Google.com to verify Internet connectivity
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
                                            # Fush DNS cache
alias zshrc='codeium ~/.zshrc'              # Edit .zshrc in Codium
alias topten="history | commands | sort -rn | head"
                                            # Hit the top ten History of Commands
alias myip="curl http://ipecho.net/plain; echo"
                                            # Use the internet page to reflect my outside IP
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias update="source ~/.zshrc"              # Re-Source .zshrc
alias runp="lsof -i "

alias zshconf="codium ~/.zshrc"             # .zshrc Editing Alias
alias ohmyzsh="codium ~/.oh-my-zsh"         # .oh-my-zsh Editing Alias
alias mount='mount |column -t'				# Make the mount command output in human readable format
alias sudo='sudo '							# Enable aliases to be sudo’ed


#########################
# 	Networking

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias whois="whois -h whois-servers.net"			# Enhanced WHOIS lookups
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; sudo gem update'	# Get OS X Software Updates, and update installed Ruby gems, Homebrew, and their installed packages
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder" 	# Flush Directory Service cache
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"	# Clean up LaunchServices to remove duplicates in the “Open With” menu



########################################################################
####                 Mac OS X Specific Commands                     ####
########################################################################
# alias man ()="man -t $1 | open -f -a /Applications/Preview.app"
                                            # Open a Man page in Preview rather than in the Command Line Interface

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias lumos='lux all light' # Aliases to move workspace from dark to light
alias nox='lux all dark'    # Aliases to move workspace from light to dark
alias -g 2clip='| pbcopy'   # Alias 2clip to send to Mac PastBoard
alias -g clip2='pbpaste |'  # Alias clip2 to paste from Mac Pasteboard

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
  alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#   ScreensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
  alias ScreensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

# 	Canonical hex dump; some systems have this symlinked
#   -----------------------------------------------------------------------------------
	command -v hd > /dev/null || alias hd="hexdump -C"

# 	OS X has no `md5sum`, so use `md5` as a fallback
#   -----------------------------------------------------------------------------------
	command -v md5sum > /dev/null || alias md5sum="md5"

# 	OS X has no `sha1sum`, so use `shasum` as a fallback
#   -----------------------------------------------------------------------------------
	command -v sha1sum > /dev/null || alias sha1sum="shasum"


# 	Recursively delete `.DS_Store` files
#   -----------------------------------------------------------------------------------
	alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# 	Empty the Trash on all mounted volumes and the main HDD
# 	Also, clear Apple’s System Logs to improve shell startup speed
#   -----------------------------------------------------------------------------------
	alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# 	Show/hide hidden files in Finder
#   -----------------------------------------------------------------------------------
	alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
	alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# 	Hide/show all desktop icons (useful when presenting)
#   -----------------------------------------------------------------------------------
	alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
	alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# 	Merge PDF files
# 	Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
#   -----------------------------------------------------------------------------------
	alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# 	Disable Spotlight
#   -----------------------------------------------------------------------------------
	alias spotoff="sudo mdutil -a -i off"

# 	Enable Spotlight
#   -----------------------------------------------------------------------------------
	alias spoton="sudo mdutil -a -i on"

# 	PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
#   -----------------------------------------------------------------------------------
# 	alias plistbuddy="/usr/libexec/PlistBuddy"

# 	Make Grunt print stack traces by default
#   -----------------------------------------------------------------------------------
	command -v grunt > /dev/null && alias grunt="grunt --stack"

# 	Lock the screen (when going AFK)
#   -----------------------------------------------------------------------------------
	alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"


# alias darkmode="osascript -e 'tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

########################################################################
####                       Homebrew Commands                        ####
########################################################################
alias -g BrewMe="brew update && brew upgrade"  # Use this command to update/upgrade Homebrew
alias -g BrewGreedy="brew update && brew upgrade --greedy --verbose"
                                            # Use this command to force upgrades to all installed casks (Note 20230627, having an issue/error with this line, need to research issue)
########################################################################
####                       Github Aliases                           ####
########################################################################
function gc { git commit -m "$@"; }
alias gcm="git checkout master";
alias gs="git status";
alias gpull="git pull";
alias gf="git fetch";
alias gfa="git fetch --all";
alias gf="git fetch origin";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gb="git branch";
alias gbr="git branch remote"
alias gfr="git remote update"
alias gbn="git checkout -B "
alias grf="git reflog";
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git gpush --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

## checkout a new remote branch (exists remote, not locally)
## git checkout -b LocalName origin/remotebranchname (checkout a remote branch)

########################################################################
####                       Docker Aliases                           ####
########################################################################
# alias dockerstop='docker-compose stop'
# alias dockerrestart='docker-compose restart'
# alias dockerup='docker-compose up -d'
# alias dockerrm='docker-compose rm --all'

########################################################################
####                        NPM Aliases                             ####
########################################################################
# alias npm-update="npx npm-check -u";
# alias ni="npm install";
# alias nrs="npm run start -s --";
# alias nrb="npm run build -s --";
# alias nrd="npm run dev -s --";
# alias nrt="npm run test -s --";
# alias nrtw="npm run test:watch -s --";
# alias nrv="npm run validate -s --";
# alias rmn="rm -rf node_modules";
# alias flush-npm="rm -rf node_modules && npm i && echo NPM is done";

########################################################################
####                         Yarn Aliases                           ####
########################################################################
# alias yar="yarn run"; # lists all the scripts we have available
# alias yab="yarn build"; # build dist directory for each package
# alias yal="yarn lint:fix"; # format source and auto-fix eslint issues
# alias yac="yarn commit"; # open a Q&A prompt to help construct valid commit messages
# alias yas="yarn start";
# alias yasb="yarn storybook:start"; # start storybook
# alias yat="yarn test"; # run the unit tests*
# alias yatw="yarn test:watch"; #run the unit tests for files changed on save

## this loads NVM
# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Aliases to move workspace from light to dark

# Config Editing Aliases




########################################################################
####                        Other Aliases                           ####
########################################################################
