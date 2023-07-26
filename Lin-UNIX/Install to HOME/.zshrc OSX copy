#!/bin/zsh
########################################################################
####    My Custom .zshrc for Mac OS X (13.4.1 currently) 20230725   ####
########################################################################
# Definition:
# zshrc files (for MacOS or other Zsh environments) are both files on your local system used to
# create aliases, which are like keyboard shortcuts for your shell or terminal. Zshrc is more 
# in-depth as it can not only be used to set aliases but can also include setup scripts and 
# default environment variables
#
# In my .zshrc file I initiate both Oh My ZSH, and Powerlevel 10k for zsh shell design and prompts
# I also break out my Path, Scripts and Aliases into Seperate files and call them (source) from the .zshrc

########################################################################
####   Source Config files (path.zsh, aliases.zsh, scripts.zsh)  ####
########################################################################
# Load seperated config files
for FILE in "$HOME/.dotfiles/"*.zsh; do
  source "${FILE}"
done


########################################################################
####                    Enable Powerlevel 10K                       ####
########################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Quiet the errors from instant Prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


########################################################################
####          Environment Varible to source my Oh My ZSH            ####
########################################################################
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

########################################################################
####         Source Homebrew zsh shell completions and enable       ####
########################################################################

# Source HomeBrewss zsh Syntax Highlighting and Auto Suggestions
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Activate HomeBrew's zsh Completions
  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

########################################################################
####           zsh and oh my zsh environment variables              ####
########################################################################
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

########################################################################
####              Set all History Env Variables                     ####
########################################################################  
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy.mm.dd"

# HISTTIMEFORMAT="%Y-%m-%d-%T"  #No Longer needed in zsh as zsh has History Timestamps built in
# To display History with time stamps shown use the - commands 
# examples:
# history -i  (Displays in ISO 8601 format (yyyy-mm-dd hh:mm))
# history -d  (Displays only the timstamp then the command, no dates)
# You can also use the "fc" command to display command history with timestamps
# Example:
# fc -lf      (Displays US Standard date and timestamp)
# fc -li      (Displays the ISO date time format)
# fc -ld      (Displays only the time, no date)

HISTFILE=~/.zsh_history                   # Set History Save File name/location
HISTSIZE=50000                            # Establish History Size
SAVEHIST=50000                            # Establish History Save File size

########################################################################
####                      Oh My ZSH Plugins                         ####
########################################################################                         
# Which plugins would you like to load? Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse) Note: Add wisely, as too many
# plugins slow down shell startup.

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
        copyfile
        dirhistory
        1password
        zsh-lux
        aliases
        alias-finder
        common-aliases
        colorize
        colored-man-pages
        web-search
        sudo
        extract
        history
        gnu-utils
        iterm2
        dotenv
        macos
        gpg-agent
        keychain
        git
        git-extras
        github
        gitignore
        pip
        python
        ruby
        jruby
        rails
        node
        aws
        nmap
        xcode
        )

ZSH_DISABLE_COMPFIX="true"

# command for zsh-completions 
autoload -U compinit && compinit

# Source Oh My zsh
source $ZSH/oh-my-zsh.sh

# Source some Home Brewed zsh plugins
# Non listed ATM (Reserved Space)

########################################################################
####                 Programming Configurations                     ####
########################################################################
# Ruby Tie Ins
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# Java Dev Kit
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Open SSL Tie Ins
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

########################################################################
####                 Other User Configurations                      ####
########################################################################     
# Adding in fzf sourcing command
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable shell completion for OnePassword Commands
eval "$(op completion zsh)"; compdef _op op

# Setup Colorization
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="colorful"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
# export LSCOLORS='exfxcxdxbxegedabagacad'      # Set LS Colors to Dark Mode (Unneeded with exa)
# export LSCOLORS='ExFxBxDxCxegedabagacad'    # Set LS Colors to light mode (Unneeded with exa)
# export CLICOLOR=true                          # Set CLI Colors On (Unneeded)
export MANPATH="/usr/local/man:$MANPATH"      # Set the Manpath Variable
export LANG=en_US.UTF-8                       # manually setting language environment

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nano'
else
 export EDITOR='codium'
fi

########################################################################
####                         Set zsh Options                        ####
########################################################################    
# Job Control
setopt NO_BG_NICE                 # Do not Throttle background tasks
setopt HUP                        # Send the HUP signal to running jobs when the shell exits.
setopt LOCAL_OPTIONS              # allow functions to have local options
setopt LOCAL_TRAPS                # allow functions to have local traps
setopt SHARE_HISTORY              # share history between sessions ???
setopt EXTENDED_HISTORY           # add timestamps to history
setopt PROMPT_SUBST               # parameter expansion, command substitution and arithmetic expansion performed in prompt
setopt CORRECT                    # Try to correct the spelling of commands.
setopt COMPLETE_IN_WORD           # completion is done from both ends.
setopt APPEND_HISTORY             # adds history
setopt INC_APPEND_HISTORY         # adds history incrementally and share it across sessions
setopt SHARE_HISTORY              # Share History between multiple sessions
setopt HIST_IGNORE_ALL_DUPS       # don't record dupes in history
setopt HIST_REDUCE_BLANKS         # Remove superfluous blanks from each command line being added to the history list
setopt HIST_IGNORE_DUPS           # Do not enter command lines into history if they are duplicates of a previous entry
setopt HIST_IGNORE_SPACE          # Remove commands when the command starts with a space, or when the alias contains one
setopt HIST_VERIFY                # If the user enters a line with history expansion, don’t execute; instead, perform history expansion and reload into the editing buffer.
setopt HIST_EXPIRE_DUPS_FIRST     # cause the oldest event that has a duplicate to be lost before a unique event is removed

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
	# shellcheck disable=SC1091
	. /usr/local/opt/fzf/shell/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi

# Test iTerm 2 zsh shell intergration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

########################################################################
####          Re-Sourcing my Aliases file to temp fix issue         ####
########################################################################     
source $HOME/.dotfiles/aliases.zsh

########################################################################
####          Call Neofetch and CPUFetch at Shell Start             ####
########################################################################     
cpufetch --color arm
neofetch
