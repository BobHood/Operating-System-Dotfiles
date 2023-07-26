#!/bin/sh
########################################################################
####                 custom zsh shell functions                     ####
########################################################################

# Add note to Notes.app (OS X 10.8+)
# Usage: `note 'title' 'body'` or `echo 'body' | note`
# Title is optional
function note() {
        local title
        local body
        if [ -t 0 ]; then
                title="$1"
                body="$2"
        else
                title=$(cat)
        fi
        osascript >/dev/null <<EOF
tell application "Notes"
        tell account "iCloud"
                tell folder "Notes"
                        make new note with properties {name:"$title", body:"$title" & "<br><br>" & "$body"}
                end tell
        end tell
end tell
EOF
}

# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
function remind() {
        local text
        if [ -t 0 ]; then
                text="$1" # argument
        else
                text=$(cat) # pipe
        fi
        osascript >/dev/null <<EOF
tell application "Reminders"
        tell the default list
                make new reminder with properties {name:"$text"}
        end tell
end tell
EOF
}

# Open the man page for the previous command. 
function lman () {
    set -- $(fc -nl -1); while [ "$#" -gt 0 -a '(' "sudo" = "$1" -o "-" = "${1:0:1}" ')' ]; do shift; done; man "$1" || help "$1";
}


# Show the given file(s) in the Finder.
function show {
        # Default to the current directory.
        [ $# -eq 0 ] && set -- .;

        # Build the array of paths for AppleScript.
        local path paths=();
        for path; do
                # Make sure each path exists.
                if ! [ -e "$path" ]; then
                        echo "show: $path: No such file or directory";
                        continue;
                fi;

                # Crappily re-implement "readlink -f" ("realpath") for Darwin.
                # (The "cd ... > /dev/null" hides CDPATH noise.)
                [ -d "$path" ] \
                        && path="$(cd "$path" > /dev/null && pwd)" \
                        || path="$(cd "$(dirname "$path")" > /dev/null && \
                         echo "$PWD/$(basename "$path")")";

                # Use the "POSIX file" AppleScript syntax.
                paths+=("POSIX file \"${path//\"/\"}\"");
        done;
        [ "${#paths[@]}" -eq 0 ] && return;

        # Group all output to pipe through osacript.
        {
                echo 'tell application "Finder"';
                echo -n 'select {'; # "reveal" would select only the last file.

                for ((i = 0; i < ${#paths[@]}; i++)); do
                        echo -n "${paths[$i]}";
                        [ $i -lt $(($# - 1)) ] && echo -n ', '; # Ugly array.join()...
                done;

                echo '}';
                echo 'activate';
                echo 'end tell';
        } | osascript;
}


# Use PHP's built-in support to encode and decode base64.
function base64 {
    if [ $# -eq 0 ]; then
        echo 'Usage: base64 [encode|decode] <string>';
        return;
    elif [ "$1" = 'decode' ]; then
        action='decode';
        shift;
    elif [ "$1" = 'encode' ]; then
        action='encode';
        shift;
    else
        action='decode';
    fi;
    echo "$@" | php -r "echo base64_$action(file_get_contents('php://stdin'));";
    echo;
}


# Delete all files that match a certain pattern from the current directory
function deletefiles() {
    local q="${1:-*.DS_Store}"
    find . -type f -name "$q" -ls -delete
}

# Change working directory to the top-most Finder window location

function cdf() { # short for `cdfinder`
        cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

#   extract:  Extract most known archives with one command
#   ---------------------------------------------------------
  extract () {
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   tar xjf $1     ;;
          *.tar.gz)    tar xzf $1     ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar e $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xf $1      ;;
          *.tbz2)      tar xjf $1     ;;
          *.tgz)       tar xzf $1     ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)     echo "'$1' cannot be extracted via extract()" ;;
           esac
       else
           echo "'$1' is not a valid file"
       fi
     }


# Create a new directory and enter it
function mkd() {
        mkdir -p "$@" && cd "$@"
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
        local tmpFile="${@%/}.tar"
        tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

        size=$(
                stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
                stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
        )

        local cmd=""
        if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
                # the .tar file is smaller than 50 MB and Zopfli is available; use it
                cmd="zopfli"
        else
                if hash pigz 2> /dev/null; then
                        cmd="pigz"
                else
                        cmd="gzip"
                fi
        fi

        echo "Compressing .tar using \`${cmd}\`…"
        "${cmd}" -v "${tmpFile}" || return 1
        [ -f "${tmpFile}" ] && rm "${tmpFile}"
        echo "${tmpFile}.gz created successfully."
}

# Determine size of a file or total size of a directory
function fs() {
        if du -b /dev/null > /dev/null 2>&1; then
                local arg=-sbh
        else
                local arg=-sh
        fi
        if [[ -n "$@" ]]; then
                du $arg -- "$@"
        else
                du $arg .[^.]* *
        fi
}

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
        function diff() {
                git diff --no-index --color-words "$@"
        }
fi

# Sort the "du" output and use human-readable units.
function duh {
        du -sk "$@" | sort -n | while read size fname; do
                for unit in KiB MiB GiB TiB PiB EiB ZiB YiB; do
                        if [ "$size" -lt 1024 ]; then
                                echo -e "${size} ${unit}\t${fname}";
                                break;
                        fi;
                        size=$((size/1024));
                done;
        done;
}

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
  spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#########################
#	Process Management

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
  findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
  alias memHogsTop='top -l 1 -o rsize | head -20'
  alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
  alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
  alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   -----------------------------------------------------------------------------------
  alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
  my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
  ii() {
      echo -e "\nYou are logged on ${RED}$HOST"
      echo -e "\nAdditionnal information:$NC " ; uname -a
      echo -e "\n${RED}Users logged on:$NC " ; w -h
      echo -e "\n${RED}Current date :$NC " ; date
      echo -e "\n${RED}Machine stats :$NC " ; uptime
      echo -e "\n${RED}Current network location :$NC " ; scselect
      echo -e "\n${RED}Public facing IP Address :$NC " ;myip
      echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
      echo
    }



## custom functions
# gpr() {
#   if [ $? -eq 0 ]; then
#     github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
#     branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
#     pr_url=$github_url"/compare/master..."$branch_name
#     open $pr_url;
#   else
#     echo 'failed to open a pull request.';
#   fi
# }

# commands() {
#   awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
# }