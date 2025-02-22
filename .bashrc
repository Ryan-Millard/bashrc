# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

export PS1='[\A] \w \$ '
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
export LD_LIBRARY_PATH="/usr/lib:/usr/lib/x86_64-linux-gnu"
export LD_LIBRARY_PATH="/usr/lib:/usr/lib/x86_64-linux-gnu"
export LD_LIBRARY_PATH="/usr/lib:/usr/lib/x86_64-linux-gnu"
export LD_LIBRARY_PATH="/usr/lib:/usr/lib/x86_64-linux-gnu"

cd /mnt/c/Users/Nicholas/OneDrive/Desktop

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Laziness
alias cls="clear"

#set path to the JavaFX SDK
export JAVA_FX_SDK_PATH="/home/ryan/javafx/openjfx-21.0.1_linux-x64_bin-sdk/javafx-sdk-21.0.1"
# Alias for compiling JavaFX applications
alias jfxc="javac --module-path $JAVA_FX_SDK_PATH/lib --add-modules javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web,javafx.swt"
# Alias for running JavaFX applications
alias jfx="java --module-path $JAVA_FX_SDK_PATH/lib --add-modules javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web,javafx.swt"

# Alias for compiling C++ apps
alias cpp='function _cpp() { g++ "$1.cpp" -o "$1"; }; _cpp'
# Alias for compiling and runnig C++ apps in one command
alias rcpp='function _rcpp() { g++ "$1.cpp" -o "$1" && ./$1 && rm ./$1; }; _rcpp'

# Alias standalone vim command to open NERDTree in current dir
# Old version
# alias nerd='function _NERDTree_VimOpen { vim -c NERDTree -c "only"; }; _NERDTree_VimOpen'
#new version
alias nerd='function _NERDTree_VimOpen
{
	# Check if an argument is provided
	if [ -z "$1" ]; then
		# If no argument is provided, open NERDTree in the current directory
		vim -c "NERDTree" -c "only";
	else
		# If an argument is provided, open NERDTree in the specified directory
		vim -c "NERDTree $1" -c "only";
				fi;
			}; _NERDTree_VimOpen'


# DOTNET / .NET / dotnet / Dotnet / .net
export PATH="/snap/bin:$PATH"

# cmd default file open for Windows
# no args opens the file explorer
# open 1 or more files as args
# * as wildcard to open everything
# if file doesn't exist and there is arg, user prompted y/n to create
alias open='function _open() {
for arg in "$@"; do
	if [ -e "$arg" ]; then
		explorer.exe "$arg";
	else
		# Print the message in red
		echo -e "\033[31m$arg does not exist.\033[0m Do you want to create it? (y/n)";
		read -r response;
		case "$response" in
			[yY]* ) touch "$arg" && explorer.exe "$arg";;
			[nN]* ) echo "File not created.";;
			* ) echo "Invalid response. File not created.";;
		esac
		fi
	done
}; _open'

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# /opt/lamp/lampp
alias xampp='function _lampp() { sudo /opt/lampp/lampp "$@"; }; _lampp'
export PATH="$HOME/.phpenv/bin:$PATH"

# PHP
# eval "$(phpenv init --path)"
eval "$(phpenv init -)"

# Android
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$ANDROID_HOME # Because sdkmanager prefers it :')

# Markdown to HTML file for viewing
#	It allows multiple md files to be converted, then opened for viewing in the preferred WSL browser
alias md='function _md() { for file in "$@"; do pandoc "$file" -o "$file.html" && explorer.exe "$file.html" && rm "$file.html"; done; }; _md'

# Gradle
export GRADLE_HOME=/opt/gradle/gradle-8.2.1
export PATH=$PATH:$GRADLE_HOME/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
