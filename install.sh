#!/bin/bash

CONFIG="$HOME/.vim/vimrc"
PLUGDIR="$HOME/.vim/plugged"
COLORS="$HOME/.vim/colors"

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'

declare -a DEPENDENCIES=("curl"
			 "ctags"
			 "ack"
			 "cscope"
			)

declare -a PLUGSRC=("https://github.com/scrooloose/nerdtree.git"
		    "https://github.com/jlanzarotta/bufexplorer.git"
		    "https://github.com/vim-scripts/taglist.vim.git"
		    "https://github.com/ntpeters/vim-better-whitespace.git"
		    "https://github.com/vim-scripts/vsearch.vim.git"
		    "https://github.com/mileszs/ack.vim.git"
		    "https://github.com/frazrepo/vim-rainbow"
		    )

function returnCheck() {
	if [ x$? != x0 ]; then
		echo "[${RED}ERROR${NC}] exit"
		exit
	fi
}

echo "[${GREEN}INFO${NC}] start"

for dep in ${DEPENDENCIES[@]}
do
	which $dep &>/dev/null
	if [ x$? != x0 ]; then
		echo "[${GREEN}INFO${NC}] install '$dep'"

		if [[ "$OSTYPE" == "linux-gnu"* ]]; then
			sudo apt-get install -y $dep
		elif [[ "$OSTYPE" == "darwin"* ]]; then
			sudo brew install -y $dep
		fi
		returnCheck
	fi
done

echo "[${GREEN}INFO${NC}] download 'vim-plug'"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
returnCheck

mkdir -p $COLORS
cp colors/molokai.vim $COLORS

mkdir -p $PLUGDIR
pushd $PLUGDIR &>/dev/null

for plug in ${PLUGSRC[@]}
do
	echo "[${GREEN}INFO${NC}] clone '$plug'"
	git clone $plug
	returnCheck

	PLUGS=$(cat <<-END
		$PLUGS
		Plug '$plug'
		END
		)
done

popd &>/dev/null

echo "[${GREEN}INFO${NC}] configure 'vimrc'"

cat <<EOF > $CONFIG
"Plugin list"
call plug#begin('$PLUGDIR')
$PLUGS
$NULLLINE
call plug#end()
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"Common"
set encoding=utf-8
set nu
set ruler
set hlsearch
set noignorecase
set incsearch
set cursorline
set cursorcolumn
colorscheme molokai
syntax on
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"NerdTree"
noremap to :NERDTree<CR>
noremap tq :NERDTreeClose<CR>
noremap tp :NERDTreeFind<CR>
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"BufExplorer"
map bo :BufExplorer<CR>
map bt :ToggleBufExplorer<CR>
map bh :BufExplorerHorizontalSplit<CR>
map bv :BufExplorerVerticalSplit<CR>
"let g:bufExplorerSplitRight=1
"switch buffer
nmap bn :bn<CR>
nmap bp :bp<CR>
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"TagList"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"map <F2> :call Tlist()<CR>
map tl :call Tlist()<CR>
func! Tlist()
exec "TlistToggle"
endfun
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"Better whitespace"
map wt :ToggleWhitespace<CR>
map wr :StripWhitespace<CR>
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"Search for selected text"
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"Ack"
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
cnoreabbrev AckFile AckFile!
nnoremap <Leader>a :AckFile!<Space>
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"Highlight functions"
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=blue
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"rainbow"
let g:rainbow_active = 1
EOF

cat <<EOF >> $CONFIG
$NULLLINE
"cscope"
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

EOF
echo "[${GREEN}INFO${NC}] end"
