#!/bin/bash

# Copyright (c) 2018 Ye Chenglin <yechnlin@gmail.com>

SOURCE_PLUGINS="plugins"
SOURCE_CONFIG="conf"
SOURCE_BIN="bin"

TARGET_VIM=".vim"
TARGET_BIN="/usr/local/bin"

BIN_VIM="/usr/bin/vim"
BIN_CTAGS="/usr/bin/ctags"
BIN_CSCOPE="/usr/bin/cscope"

LOCAL_PATH=`pwd`
USER_NAME=`whoami`

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

cd /home/$USER_NAME

function install_vim() {
    cp -r $LOCAL_PATH/$SOURCE_PLUGINS/* $TARGET_VIM
    cp -r $LOCAL_PATH/$SOURCE_CONFIG/* $TARGET_VIM
    sudo cp $LOCAL_PATH/$SOURCE_BIN/* $TARGET_BIN
}

if [ ! -d "$TARGET_VIM" ]; then
    mkdir -p $TARGET_PATH
    install_vim
else
    install_vim
fi

echo -e '\033[32mINFO:\033[0m'
echo -e '\033[32m  Install successfully...\033[0m'
