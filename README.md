# AutoVim

![logo](./images/logo.png)

**AutoVim** is a tool helps to configure **vim** automatically.

[![Build Status](https://travis-ci.org/yechenglin-dev/AutoVim.svg?branch=master)](https://travis-ci.org/yechenglin-dev/AutoVim)

## Getting start

```
bash <(curl -s -L https://raw.githubusercontent.com/yechenglin-dev/autovim/master/install.sh)
```

**NOTE:** it can be supported on **Ubuntu** and **MacOS**.

## Plugins

Following plugins can be configured by default,

* [vim-plug](https://github.com/junegunn/vim-plug.git)
* [NERDTree](https://github.com/scrooloose/nerdtree.git)
* [BufExplorer](https://github.com/jlanzarotta/bufexplorer.git)
* [TagList](https://github.com/vim-scripts/taglist.vim.git)
* [Better whitespace](https://github.com/ntpeters/vim-better-whitespace.git)
* [VSearch](https://github.com/vim-scripts/vsearch.vim.git)
* [TabNine](https://github.com/zxqfl/tabnine-vim.git)
* [Ack](https://github.com/mileszs/ack.vim.git)

## Shortcuts

- Switch windows

    | Command | Description |
    |:-------:|-------------|
    | `Ctrl`+`w`+`j/k/h/l` | switch window to `up/down/left/right` |

- **NERDTree**

    | Command | Description |
    |:-------:|-------------|
    | to | tree open, enter the directory tree |
    | tq | tree quit, exit the directory tree |
    | tp | tree pwd, jump to the current file path in directory tree |

- **BufExplorer**

    | Command | Description |
    |:-------:|-------------|
    | bo | buffer open |
    | bh | buffer force horizontal split open |
    | bv | buffer force vertical split open |
    | bp | buffer previous, jump to previous buffer |
    | bn | buffer next, jump to next buffer |

- **TagList**

    | Command | Description |
    |:-------:|-------------|
    | tl | tag list open |

- **Better whitespace**

    | Command | Description |
    |:-------:|-------------|
    | wt | whitespace toggle |
    | wr | whitespace remove |

- **VSearch**

    | Command | Description |
    |:-------:|-------------|
    | * | search the selected text, user can select a block text by `v` or `Ctrl+v`  command |

- **Ack**

    | Command | Description |
    |:-------:|-------------|
    | :Ack [options] {pattern} [{directories}] | Search recursively in {directories} (which defaults to the current directory) for the {pattern} |
    | :AckFile {filename} [{directories}] | find filr {filename} from {directories} |

    shortcuts after get search result as following,

    ```
    ?    a quick summary of these keys, repeat to close
    o    to open (same as Enter)
    O    to open and close the quickfix window
    go   to preview file, open but maintain focus on ack.vim results
    t    to open in new tab
    T    to open in new tab without moving to it
    h    to open in horizontal split
    H    to open in horizontal split, keeping focus on the results
    v    to open in vertical split
    gv   to open in vertical split, keeping focus on the results
    q    to close the quickfix window
    ```

    for more ack help see ack [documentation](https://beyondgrep.com/documentation/).
