#!/usr/bin/env bash


# script to restore backed up dotfiles

# include library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

if [[ -z $1 ]]; then
  error "you need to specify a backup folder date. Take a look in ~/.dotfiles_backup/ to see which backup date you wish to restore."
  exit 1
fi


bot "Restoring dotfiles from backup..."

pushd ~/.dotfiles_backup/$1

for file in .*; do
  if [[ $file == "." || $file == ".." ]]; then
    continue
  fi

  if [[ -e ./$file ]]; then
      mv ./$file ./
      echo -en "$1 backup restored";ok
  fi
  echo -en '\done';ok
done

popd

bot "All done."
