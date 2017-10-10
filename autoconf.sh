#!/bin/bash

#Author:Chenglin.Ye
#Date:2016/12/14
#Description:auto configurate vim plugin.

SOURCE_PROFILE_PATH='./profile/*'
SOURCE_FILE_VIMRC='./vimrc'
SOURCE_BIN_CT="./ct"

TARGET_PROFILE_PATH='/usr/share/vim/vim74'
TARGET_FILE_VIMRC='/etc/vim/vimrc'
TARGET_BIN_PATH="/usr/local/bin/"

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
#      cat $SOURCE_FILE_VIMRC >> $TARGET_FILE_VIMRC
      cat $SOURCE_FILE_VIMRC | tee -a $TARGET_FILE_VIMRC
    else
      echo "please install cscope firstly"
    fi
  else
    echo "please isntall ctags firstly"
  fi
else
  echo "please install vim fistly"
fi
