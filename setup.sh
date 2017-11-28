#!/bin/sh

if [ ! -f ~/.bashrc ]
then
  ln -s dotfiles/bashrc ~/.bashrc
  echo ".bashrc linked"
else
  echo ".bashrc already exists"
fi

if [ ! -f ~/.nanorc ]
then
  ln -s dotfiles/nanorc ~/.nanorc
  echo ".nanorc linked"
else
  echo ".nanorc already exists"
fi

if [ ! -f ~/.tmux.conf ]
then
  ln -s dotfiles/tmux.conf ~/.tmux.conf
  echo ".tmux.conf linked"
else
  echo ".tmux.conf already exists"
fi

if [ ! -f ~/.profile ]
then
  ln -s dotfiles/profile ~/.profile
  echo ".profile linked"
else
  echo ".profile already exists"
fi

if [ ! -f ~/.gitconfig ]
then
  ln -s dotfiles/gitconfig ~/.gitconfig
  echo ".gitconfig linked"
else
  echo ".gitconfig already exists"
fi
