#!/bin/bash

setup-dotfiles() {
  local GREEN RED YELLOW RESET
  GREEN='\033[0;32m'
  RED='\033[0;31m'
  YELLOW='\033[0;33m'
  RESET='\033[0m'

  local GIT_PUSH_URL GIT_DIR
  GIT_PUSH_URL='git@github.com:xpac1985/dotfiles.git'
  GIT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) # stolen from https://stackoverflow.com/a/246128/2177148

  
  ### .bashrc
  
  if [ ! -f ~/.bashrc ]
  then
    # file doesn't exist
    ln -s ~/dotfiles/bashrc ~/.bashrc && echo -e "${GREEN}.bashrc link created${RESET}"
  else
    if [ -L ~/.bashrc ] && [ "$(readlink ~/.bashrc)" = ~/dotfiles/bashrc ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.bashrc already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      if grep -q 'source ~/dotfiles/bashrc' ~/.bashrc
      then
        # file has a source statement for dotfiles
        echo -e "${GREEN}.bashrc already exists, and it sources dotfiles/bashrc${RESET}"
      else
        # file does not have a source statement for dotfiles
        printf '\nsource ~/dotfiles/bashrc\n' >> ~/.bashrc
        if [ $? -eq 0 ]
        then
          # successfully added source statement to file
          echo -e "${YELLOW}created 'source' statement in ~/.bashrc to dotfiles${RESET}"
        else
          # failed to add source statement to file
          echo -e "${RED}failed to create 'source' statement in ~/.bashrc to dotfiles${RESET}"
        fi
      fi
    fi
  fi
  
  
  ### .nanorc
  
  if [ ! -f ~/.nanorc ]
  then
    # file doesn't exist
    ln -s ~/dotfiles/nanorc ~/.nanorc && echo -e "${GREEN}.nanorc link created${RESET}"
  else
    if [ -L ~/.nanorc ] && [ "$(readlink ~/.nanorc)" = ~/dotfiles/nanorc ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.nanorc already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.nanorc ~/.nanorc.bak && ln -s ~/dotfiles/nanorc ~/.nanorc
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
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf && echo -e "${GREEN}.tmux.conf link created${RESET}"
  else
    if [ -L ~/.tmux.conf ] && [ "$(readlink ~/.tmux.conf)" = ~/dotfiles/tmux.conf ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.tmux.conf already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.tmux.conf ~/.tmux.conf.bak && ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
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
    ln -s ~/dotfiles/profile ~/.profile && echo -e "${GREEN}.profile link created${RESET}"
  else
    if [ -L ~/.profile ] && [ "$(readlink ~/.profile)" = ~/dotfiles/profile ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.profile already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.profile ~/.profile.bak && ln -s ~/dotfiles/profile ~/.profile
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
    ln -s ~/dotfiles/vimrc ~/.vimrc && echo -e "${GREEN}.vimrc link created${RESET}"
  else
    if [ -L ~/.vimrc ] && [ "$(readlink ~/.vimrc)" = ~/dotfiles/vimrc ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.vimrc already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.vimrc ~/.vimrc.bak && ln -s ~/dotfiles/vimrc ~/.vimrc
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

  
  ### init.vim
  # symlink from vimrc
  
  if [ ! -f ~/.config/nvim/init.vim ]
  then
    # file doesn't exist
    if [ ! -d ~/.config/nvim/ ]; then
      # config directory doesn't exist
      mkdir -p ~/.config/nvim/ && echo -e "${GREEN}nvim config directory created${RESET}"
    fi
    ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim && echo -e "${GREEN}vim.init link created${RESET}"
  else
    if [ -L ~/.config/nvim/init.vim ] && [ "$(readlink ~/.config/nvim/init.vim)" = ~/dotfiles/vimrc ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}vim.init already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak && ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
      if [ $? -eq 0 ]
      then
        # successfully added moved old file and linked to dotfiles
        echo -e "${YELLOW}Moved existing ~/.config/nvim/init.vim to ~/.config/nvim/init.vim.bak, then linked init.vim to dotfiles${RESET}"
      else
        # failed to either move old file or link to dotfiles
        echo -e "${RED}Failed to either move ~/.config/nvim/init.vim to ~/.config/nvim/init.vim.bak or create symlink${RESET}"
      fi
    fi
  fi
 
  
  ### .gitconfig
  
  if [ ! -f ~/.gitconfig ]
  then
    # file doesn't exist
    ln -s ~/dotfiles/gitconfig ~/.gitconfig && echo -e "${GREEN}.gitconfig link created${RESET}"
  else
    if [ -L ~/.gitconfig ] && [ "$(readlink ~/.gitconfig)" = ~/dotfiles/gitconfig ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.gitconfig already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.gitconfig ~/.gitconfig.bak && ln -s ~/dotfiles/gitconfig ~/.gitconfig
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


  ### .ssh/config
  
  if [ ! -f ~/.ssh/config ]
  then
    # file doesn't exist
    ln -s ~/dotfiles/sshconfig ~/.ssh/config && echo -e "${GREEN}.ssh/config link created${RESET}"
  else
    if [ -L ~/.ssh/config ] && [ "$(readlink ~/.ssh/config)" = ~/dotfiles/sshconfig ]
    then
      # file exists and is valid symlink to dotfiles
      echo -e "${GREEN}.ssh/config already linked to dotfiles${RESET}"
    else
      # file exists, but is not a valid symlink to dotfiles
      mv ~/.ssh/config ~/.ssh/config.bak && ln -s ~/dotfiles/sshconfig ~/.ssh/config
      if [ $? -eq 0 ]
      then
        # successfully added moved old file and linked to dotfiles
        echo -e "${YELLOW}Moved existing ~/.ssh/config to ~/.ssh/config.bak, then linked .ssh/config to dotfiles${RESET}"
      else
        # failed to either move old file or link to dotfiles
        echo -e "${RED}Failed to either move ~/.ssh/config to ~/.ssh/config.bak or create symlink${RESET}"
      fi
    fi
  fi


  ### Change git repo push URL

  git --git-dir="${GIT_DIR}/.git" remote -v | grep -q "${GIT_PUSH_URL}"
  if [ $? -eq 0 ]
  then
    echo -e "${GREEN}Git repo push URL already properly set to use SSH${RESET}"
  else
    git --git-dir="${GIT_DIR}/.git" remote set-url --push origin ${GIT_PUSH_URL}
    git --git-dir="${GIT_DIR}/.git" remote -v | grep "(push)" | grep -q "${GIT_PUSH_URL}"
    if [ $? -eq 0 ]; then
      echo -e "${YELLOW}Git repo push URL now set to use SSH${RESET}"
    else
      echo -e "${RED}Failed to change Git repo push URL for reasons unknown to mankind${RESET}"
    fi
  fi
}

setup-dotfiles
