#!/bin/bash
#author:charley ye
#date:2016/12/14
#description:completing vim plugin automatically.

source_dir_doc='./profile/doc/*'
source_dir_plugin='./profile/plugin/*'
source_file_vimrc='./vimrc'
target_dir_doc='/usr/share/vim/vim7*/doc'
target_dir_plugin='/usr/share/vim/vim7*/plugin'
target_file_vimrc='/etc/vim/vimrc'
file_ctags="/usr/bin/ctags"
file_cscope="/usr/bin/cscope"
file_vim="/usr/bin/vim"
source_file_ct="./ct"
target_file_ct="/usr/local/bin/"


if [ -e $file_vim ]
then 
	if [ -e $file_ctags ]
	then
		if [ -e $file_cscope ]
		then
			sudo cp $source_dir_doc $target_dir_doc
			sudo cp $source_dir_plugin $target_dir_plugin
            sudo cat $source_file_vimrc | sudo tee -a $target_file_vimrc
            sudo cp $source_file_ct $target_file_ct
        else
			echo "please install cscope firstly"
		fi
    else
  	    echo "please isntall ctags firstly"
	fi
else
	echo "please install vim fistly"
fi
