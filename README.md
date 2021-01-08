# AutoVim

![logo](./images/logo.png)

**AutoVim** is a tool helps to configure **vim** automatically.

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

## Shortcuts

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
