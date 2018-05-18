autovim
=======

Platform      |
------------- |
Linux(Ubuntu) |
 
autovim is a tool that making vim likes source insgiht.

## How to build
```
sudo ./autoconf.sh
```

## How to use
- Create files.conf
```
ct -c
```

- Open files.conf and add file types
```
#DIR
#!DIR
#FILE
.h
.c
#!FILE
```

- Synchronize files.
```
ct
```

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
