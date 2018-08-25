#
# ~/.bash_profile
#

# Load the shell dotfiles, and then some:
for file in ~/.{path,bash_prompt,exports,aliases,functions,mykaarma}; do
    [ -r "$file" ] && source "$file"
done

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# system dependent
if [ $OSX ]
 then
   for file in ~/.{mac,extra}; do
       [ -r "$file" ] && source "$file"
   done
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
