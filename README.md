autovim
=======

 Platform      | Build Status
 ------------- | ------------
 Linux(Ubuntu) |

autovim is a tool that making vim works as source insight.

## Features
* nerdtree
* taglist
* cscope
* srcexpl
* bufexplorer
* grep 
* lookupfile
* vsearch
* trail whitespace
* c/h switch
* filter dirs/files
* sychronaize files

## Pre-build
```
# install vim cscope ctags
```

## How to build
* Install autovim
```
./install.sh
```

* Check installation status
```
which ct
```

## How to use
* Create files.conf
```
ct -c
```

* Open files.conf and add file types, example following,
```
#DIR
#!DIR
#FILE
.h
.c
#!FILE
```

* Synchronize files.
```
ct
```
  so, it will only filter and sychronizie all *.h/*.c files.

## Quick commands
* `ctl+]` jump function definition
* `ctl+t` comeback previous position
* `tl` function list
* `\+g` jump position of function definition
* `\+c` jump position which the function called
* `\+s` all position of the function
* `wm` window manager
* `bn` next buff
* `bp` previous buff
* `bo` buffer open
* `to` open files tree
* `tq` close files tree
* `tp` open files tree and show cursor in current file
* `F5` lookup files from current project
* `F3` grep string from current project
* `F12` jump to current file's include file
* `*` vsearch next position
* `#` vsearch previous position
* `so` source explor
