#!/bin/sh

if [ ! -f ~/.bashrc ]
then
  ln -s ./bashrc ~/.bashrc
  echo "bashrc linked"
else
  echo ".bashrc already exists"
fi

if [ ! -f ~/.nanorc ]
then
  ln -s ./nanorc ~/.nanorc
  echo "nanorc linked"
else
  echo ".nanorc already exists"
fi

if [ ! -f ~/.tmux.conf ]
then
  ln -s ./tmux.conf ~/.tmux.conf
  echo "tmux.conf linked"
else
  echo ".tmux.conf already exists"
fi

if [ ! -f ~/.profile ]
then
  ln -s ./profile ~/.profile
  echo "profile linked"
else
  echo ".profile already exists"
fi
