#
# ~/.bashrc
#

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
#include dotfiles in wildcard expansion, and match case-insensitively
shopt -s dotglob

# Increase Bash history size. the default is 500.
export HISTSIZE='1000000';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth:erasedups';
export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a '
#export HISTTIMEFORMAT="%h/%d-%H:%M:%S  "

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

#Auto "cd" when entering just a path
shopt -s autocd

#Line wrap on window resize
shopt -s checkwinsize

# save multi-line commands in history as single line
shopt -s cmdhist


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

###### Saves terminal commands in history file in real time (for use with 'shopt -s histappend')
if [ ! -f $HOME/.bash_history ];then touch $HOME/.bash_history;fi	# ensure bash history file always there
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"	# use with 'shopt -s histappend';save terminal commands in history file in real time

###### Share history between using multiple commands (press enter before get history from other bash shells)
#PROMPT_COMMAND='history -a && history -n'
