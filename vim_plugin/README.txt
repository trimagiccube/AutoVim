功能与实现：
  
1. 能够正向找到函数和变量的定义：(Ctag)
 
    >>在对应的函数名下“CTRL+]”，会自动跳转到函数的定义部分，“CTRL+T”则返回

    >>搜索前应先生成tags文件

 
 
2. 能够反向找到函数的caller和变量的引用行 （cscope）

    >> \+s:查看函数或变量在哪里被引用

    >> \+c:反向找到函数的引用行

    >> \+d:找到此函数调用了哪些函数	 

    >> \+g:正向找到函数或变量或宏的定义

  

3. 能够在vim里看到本文件的函数列表 (Tlist）
 
    >>输入：Tlist 可显示和隐藏taglsit窗口

    >>或直接使用快捷键<F2>

  

4. 用户一条命令即可生成所有用于查找的tag，数据库等。

    >>在代码根目录下执行ct，即可创建该project的tag和数据库

  

5. 用户可定制参与查找的文件（不是查所有文件）

    >>用户将需要查找的文件或目录路径写入dir.tmp,

    >>如果没有dir.tmp,执行ct -c命令会自动创建

    >>执行ct命令便会自动查找需要的文件，并生成tag,数据库

    >>执行ct -r 命令会删除所有生成的tag,数据库文件
    >>执行ct --help 显示help



配置：
  
  1.安装VIM
   
  2.安装ctags和cscope
    
  3.执行auto_profile.sh，将自动配置好以上的功能




例：dir.tmp


#dir

arch/arm

#not_dir

drivers/fb

drivers/usb

drivers/bluetooth

#file

.c

#not_file





该配置文件意思是：

  >>查找所有*.c文件，但是arm目录下只要arm/arm目录下的文件,drivers目录下

  >>除了drivers/fb, drivers/usb, drivers/bluetooth，其他都要
