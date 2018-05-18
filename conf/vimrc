"""""""""""""""""""""""""""
"Base setup
"""""""""""""""""""""""""""
set nu  "display the number of every line
set ruler   " show the cursor position all the time
set tabstop=4
set hlsearch
set noignorecase
"show pwd
noremap <C-p> :pwd<CR>
"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /s\s\+$/

"""""""""""""""""""""""""""
"BufExplorer
"""""""""""""""""""""""""""
map bo :BufExplorer<CR>
map bt :ToggleBufExplorer<CR>
map bs :BufExplorerHorizontalSplit<CR>
map bv :BufExplorerVerticalSplit<CR>
"let g:bufExplorerSplitRight=1
"switch buffer
nmap bn :bn<CR>
nmap bp :bp<CR>

"""""""""""""""""""""""""""
"NERDTree
"""""""""""""""""""""""""""
noremap to :NERDTree<CR>
noremap tq :NERDTreeClose<CR>
noremap tp :NERDTreeFind<CR>
"noremap tt :NERDTreeToggle<CR>

"""""""""""""""""""""""""""
"languge
"""""""""""""""""""""""""""
if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif  " UTF-8

""""""""""""""""""""""""""""""
" Ctags setting
""""""""""""""""""""""""""""""
set tags=tags;
set autochdir
"auto creat tags
"map <F4> :call Ctags()<CR>
"func! Ctags()
"exec "w"
"exec "!ctags -R ."
"endfunc

""""""""""""""""""""""""""""""
" Tlist setting
""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"map <F2> :call Tlist()<CR>
map tl :call Tlist()<CR>
func! Tlist()
exec "TlistToggle"
endfun

"""""""""""""""""""""""""""
"winwanager
"""""""""""""""""""""""""""
"let g:winManagerWindowLayout='BufExplorer'
"nmap wm :WMToggle<cr>

"""""""""""""""""""""""""""
"grep
"""""""""""""""""""""""""""
nnoremap <silent> <F3> :Grep<CR>


"""""""""""""""""""""""""""
"c\h
"""""""""""""""""""""""""""
nnoremap <silent> <F12> :A<CR>

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
"if filereadable("./filenametags")
"    let g:LookupFile_TagExpr = '"./filenametags"'
"endif

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"""""""""""""""""""""""""""
"SrcExpl
"""""""""""""""""""""""""""
" // The switch of the Source Explorer
map so :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 13

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 50

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F10>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F10>"

" // Set "<F5>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F5>"

" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"
