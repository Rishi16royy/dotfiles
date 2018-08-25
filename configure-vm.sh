#!/usr/bin/env bash

# Configure the VM system

# include library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

bot "backing up dotfiles and replacing with latest..."
pushd homedir > /dev/null 2>&1
now=$(date +"%Y.%m.%d.%H.%M.%S")

cd configs
for file in .* ; do
  if [[ $file == "." || $file == ".." || $file == "configs" ]]; then
    continue
  fi
  running "$file"
  # if the file exists:
  if [[ -e ~/$file ]]; then
      if [[ -d $file ]]; then
        echo "Ignoring folders"
      else
        mkdir -p ~/.dotfiles_backup/$now
        mv ~/$file ~/.dotfiles_backup/$now/$file
        echo "backup saved as ~/.dotfiles_backup/$now/$file"
      fi
  fi

  if [[ -d $file ]]; then
      echo "Ignoring folders"
  else
      cp $file ~/$file
  fi
  bot "copied $file"
done

popd > /dev/null 2>&1
cd ..


# Check if user is part of docker group, if not add
if grep docker /etc/group ; then
  # Docker Group exists
  if ! groups | grep docker ;  then
    sudo usermod -aG docker $(whoami)
  bot "Added use to docker group"
  fi
  # User is already member of docker group
fi

# sudo chgrp -R admins /var/log/kaarya/




