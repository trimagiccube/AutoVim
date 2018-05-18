#!/bin/bash

#Author:Chenglin.Ye
#Date:2016/12/14
#Description:auto configurate vim plugin.

SOURCE_PROFILE_PATH='plugins/*'
SOURCE_FILE_VIMRC='conf/vimrc'
SOURCE_BIN_CT="bin/ct"

SOURCE_SYNTAX_HIGHFUNC='./syntax/highfunc.vim'

TARGET_PROFILE_PATH='/usr/share/vim/vim74'
TARGET_FILE_VIMRC='/etc/vim/vimrc'
TARGET_BIN_PATH="/usr/local/bin/"

TARGET_C_FILE='/usr/share/vim/vim74/syntax/c.vim'
TARGET_CPP_FILE='/usr/share/vim/vim74/syntax/cpp.vim'

BIN_VIM="/usr/bin/vim"
BIN_CTAGS="/usr/bin/ctags"
BIN_CSCOPE="/usr/bin/cscope"

set -e

if [ ! -e $BIN_VIM ]; then
    echo "== install vim == "
    sudo apt-get install -y vim
fi

if [ ! -e $BIN_CTAGS ]; then
    echo "== install ctags =="
    sudo apt-get install -y ctags
fi

if [ ! -e $BIN_CSCOPE ]; then
    echo "== install cscope =="
    sudo apt-get install -y cscope
fi

cp -r $SOURCE_PROFILE_PATH $TARGET_PROFILE_PATH
cp $SOURCE_BIN_CT $TARGET_BIN_PATH
cat $SOURCE_FILE_VIMRC | tee -a $TARGET_FILE_VIMRC > /dev/NULL
cat $SOURCE_SYNTAX_HIGHFUNC | tee -a $TARGET_C_FILE > /dev/NULL
cat $SOURCE_SYNTAX_HIGHFUNC | tee -a $TARGET_CPP_FILE > /dev/NULL

echo -e '\033[32mINFO:\033[0m'
echo -e '\033[32m  Install completely.\033[0m'
echo -e '\033[32m  ...\033[0m'
