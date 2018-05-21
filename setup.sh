#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'

### .bashrc

if [ ! -f ~/.bashrc ]
then
  # file doesn't exist
  ln -s dotfiles/bashrc ~/.bashrc && echo -e "${GREEN}.bashrc linked${RESET}"
else
  if [ -L ~/.bashrc ] && [ "$(readlink ~/.bashrc)" = "dotfiles/bashrc" ]
  then
    # file exists and is valid symlink to dotfiles
    echo -e "${GREEN}.bashrc already linked to dotfiles${RESET}"
  else
    # file exists, but is not a valid symlink to dotfiles
    if grep -q 'source dotfiles/bashrc' ~/.bashrc
    then
      # file has a source statement for dotfiles
      echo -e "${YELLOW}.bashrc already exists, and it sources dotfiles/bashrc${RESET}"
    else
      # file does not have a source statement for dotfiles
      printf '\nsource dotfiles/bashrc\n' >> ~/.bashrc
      if [ $? -eq 0 ]
      then
        # successfully added source statement to file
        echo -e "${YELLOW}Added 'source' statement to ~/.bashrc${RESET}"
      else
        # failed to add source statement to file
        echo -e "${RED}Failed to add 'source' statement to ~/.bashrc${RESET}"
      fi
    fi
  fi
fi


### .nanorc

if [ ! -f ~/.nanorc ]
then
  # file doesn't exist
  ln -s dotfiles/nanorc ~/.nanorc && echo -e "${GREEN}.nanorc linked${RESET}"
else
  if [ -L ~/.nanorc ] && [ "$(readlink ~/.nanorc)" = "dotfiles/nanorc" ]
  then
    # file exists and is valid symlink to dotfiles
    echo -e "${GREEN}.nanorc already linked to dotfiles${RESET}"
  else
    # file exists, but is not a valid symlink to dotfiles
    mv ~/.nanorc ~/.nanorc.bak && ln -s dotfiles/nanorc ~/.nanorc
    if [ $? -eq 0 ]
    then
      # successfully added moved old file and linked to dotfiles
      echo -e "${YELLOW}Moved existing ~/.nanorc to ~/.nanorc.bak, then linked .nanorc to dotfiles${RESET}"
    else
      # failed to either move old file or link to dotfiles
      echo -e "${RED}Failed to either move ~/.nanorc to ~/.nanorc.bak or create symlink${RESET}"
    fi
  fi
fi


### .tmux.conf

if [ ! -f ~/.tmux.conf ]
then
  # file doesn't exist
  ln -s dotfiles/tmux.conf ~/.tmux.conf && echo -e "${GREEN}.tmux.conf linked${RESET}"
else
  if [ -L ~/.tmux.conf ] && [ "$(readlink ~/.tmux.conf)" = "dotfiles/tmux.conf" ]
  then
    # file exists and is valid symlink to dotfiles
    echo -e "${GREEN}.tmux.conf already linked to dotfiles${RESET}"
  else
    # file exists, but is not a valid symlink to dotfiles
    mv ~/.tmux.conf ~/.tmux.conf.bak && ln -s dotfiles/tmux.conf ~/.tmux.conf
    if [ $? -eq 0 ]
    then
      # successfully added moved old file and linked to dotfiles
      echo -e "${YELLOW}Moved existing ~/.tmux.conf to ~/.tmux.conf.bak, then linked .tmux.conf to dotfiles${RESET}"
    else
      # failed to either move old file or link to dotfiles
      echo -e "${RED}Failed to either move ~/.tmux.conf to ~/.tmux.conf.bak or create symlink${RESET}"
    fi
  fi
fi


### .profile

if [ ! -f ~/.profile ]
then
  # file doesn't exist
  ln -s dotfiles/profile ~/.profile && echo -e "${GREEN}.profile linked${RESET}"
else
  if [ -L ~/.profile ] && [ "$(readlink ~/.profile)" = "dotfiles/profile" ]
  then
    # file exists and is valid symlink to dotfiles
    echo -e "${GREEN}.profile already linked to dotfiles${RESET}"
  else
    # file exists, but is not a valid symlink to dotfiles
    mv ~/.profile ~/.profile.bak && ln -s dotfiles/profile ~/.profile
    if [ $? -eq 0 ]
    then
      # successfully added moved old file and linked to dotfiles
      echo -e "${YELLOW}Moved existing ~/.profile to ~/.profile.bak, then linked .profile to dotfiles${RESET}"
    else
      # failed to either move old file or link to dotfiles
      echo -e "${RED}Failed to either move ~/.profile to ~/.profile.bak or create symlink${RESET}"
    fi
  fi
fi


### .vimrc

if [ ! -f ~/.vimrc ]
then
  # file doesn't exist
  ln -s dotfiles/vimrc ~/.vimrc && echo -e "${GREEN}.vimrc linked${RESET}"
else
  if [ -L ~/.vimrc ] && [ "$(readlink ~/.vimrc)" = "dotfiles/vimrc" ]
  then
    # file exists and is valid symlink to dotfiles
    echo -e "${GREEN}.vimrc already linked to dotfiles${RESET}"
  else
    # file exists, but is not a valid symlink to dotfiles
    mv ~/.vimrc ~/.vimrc.bak && ln -s dotfiles/vimrc ~/.vimrc
    if [ $? -eq 0 ]
    then
      # successfully added moved old file and linked to dotfiles
      echo -e "${YELLOW}Moved existing ~/.vimrc to ~/.vimrc.bak, then linked .vimrc to dotfiles${RESET}"
    else
      # failed to either move old file or link to dotfiles
      echo -e "${RED}Failed to either move ~/.vimrc to ~/.vimrc.bak or create symlink${RESET}"
    fi
  fi
fi


### .gitconfig

if [ ! -f ~/.gitconfig ]
then
  # file doesn't exist
  ln -s dotfiles/gitconfig ~/.gitconfig && echo -e "${GREEN}.gitconfig linked${RESET}"
else
  if [ -L ~/.gitconfig ] && [ "$(readlink ~/.gitconfig)" = "dotfiles/gitconfig" ]
  then
    # file exists and is valid symlink to dotfiles
    echo -e "${GREEN}.gitconfig already linked to dotfiles${RESET}"
  else
    # file exists, but is not a valid symlink to dotfiles
    mv ~/.gitconfig ~/.gitconfig.bak && ln -s dotfiles/gitconfig ~/.gitconfig
    if [ $? -eq 0 ]
    then
      # successfully added moved old file and linked to dotfiles
      echo -e "${YELLOW}Moved existing ~/.gitconfig to ~/.gitconfig.bak, then linked .gitconfig to dotfiles${RESET}"
    else
      # failed to either move old file or link to dotfiles
      echo -e "${RED}Failed to either move ~/.gitconfig to ~/.gitconfig.bak or create symlink${RESET}"
    fi
  fi
fi
