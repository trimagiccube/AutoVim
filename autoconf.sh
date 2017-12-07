#!/bin/bash

#Author:Chenglin.Ye
#Date:2016/12/14
#Description:auto configurate vim plugin.

SOURCE_PROFILE_PATH='./conf/*'
SOURCE_FILE_VIMRC='./vimrc'
SOURCE_BIN_CT="./ct"

SOURCE_SYNTAX_HIGHFUNC='./syntax/highfunc.vim'

TARGET_PROFILE_PATH='/usr/share/vim/vim74'
TARGET_FILE_VIMRC='/etc/vim/vimrc'
TARGET_BIN_PATH="/usr/local/bin/"

TARGET_C_FILE='/usr/share/vim/vim74/syntax/c.vim'
TARGET_CPP_FILE='/usr/share/vim/vim74/syntax/cpp.vim'

BIN_VIM="/usr/bin/vim"
BIN_CTAGS="/usr/bin/ctags"
BIN_CSCOPE="/usr/bin/cscope"

if [ -e $BIN_VIM ]
then
  if [ -e $BIN_CTAGS ]
  then
    if [ -e $BIN_CSCOPE ]
    then
      cp -r $SOURCE_PROFILE_PATH $TARGET_PROFILE_PATH
      cp $SOURCE_BIN_CT $TARGET_BIN_PATH
      cat $SOURCE_FILE_VIMRC | tee -a $TARGET_FILE_VIMRC > /dev/NULL
      cat $SOURCE_SYNTAX_HIGHFUNC | tee -a $TARGET_C_FILE > /dev/NULL
      cat $SOURCE_SYNTAX_HIGHFUNC | tee -a $TARGET_CPP_FILE > /dev/NULL
    else
      echo -e '\033[31mERROR:\033[0m'
      echo -e '\033[31m  No cscope installed...\033[0m'
      echo -e '\033[31m  Please install it firstly...\033[0m'
      echo -e '\033[31m  ...\033[0m'
    fi
  else
    echo -e '\033[31mERROR:\033[0m'
    echo -e '\033[31m  No ctags installed...\033[0m'
    echo -e '\033[31m  Please install it firstly...\033[0m'
    echo -e '\033[31m  ...\033[0m'
  fi
else
  echo -e '\033[31mERROR:\033[0m'
  echo -e '\033[31m  No vim installed...\033[0m'
  echo -e '\033[31m  Please install it firstly...\033[0m'
  echo -e '\033[31m  ...\033[0m'
fi

echo -e '\033[32mINFO:\033[0m'
echo -e '\033[32m  ...\033[0m'
echo -e '\033[32m  Configure successfully.\033[0m'
echo -e '\033[32m  ...\033[0m'
