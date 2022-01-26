
# linux filesystem


## EXT2文件系统(inode)
+ superblock
    + filesystem整体信息,inode/block数量

+ inode
    + 文件属性
    + 一个文件一个inode
    + 文件数据的block id（indexed allocation）
        + 数据block可以一次性读取

+ block 
    + 记录文件内容
    + 1K,2K,4K

+ block group
    + data block
    + inode table
    + superblock
    + block bitmap
        + 记录哪些block是空的
    + inode bitmap

+ boot sector
    + 开机扇区

## mount point

+ 每个 filesystem 都有独立的 inode / block / superblock
    + 在不同的磁盘分区

+ 挂载
    + filesystem与directory tree(目录树)结合的过程
    + 用一个目录当进入点，将磁盘分区的数据放置在该目录下
    + 根目录需要挂载到某个磁盘分区，其他目录可以挂载到不同分区

+ 挂载点为目录，进入filesystem的入口


## cmd

+ `ls -li` 查看inode号
+ `ll <dir>`
+ `ls -ild /  /.  /..`
    + 相同的inode号代表相同的文件
+ `cat /proc/filesystems` 支持的文件系统


## 硬链接(hard link),符号连接(symbolic link)

+ hard link
    + `ln <source file> <link file>`
    + 不可以是目录
    + 只能同一文件系统
    + 读写删除硬链接和软链接一样，删除源文件时，硬链接任然存在，保留源文件内容
    + 多个文件名指向同一个inode,可以防止误删

+ symbolic link
    + `ln -s <source file>  <link file>`
    + 链接文件包含另一个文件的路径（目录或文件）
        + 可以不同文件系统
    + 对符号链接的读写会转换到对源文件的读写

## tips

+ rwx
    + `x`可以判断文件是否可执行,能否进入目录

+ `-` 前一个工作目录

+ 文件读取过程
    + 由于目录树是由根目录开始读起，因此系统通过挂载的信息可以找到挂载点的 inode 号码，此时就能够得到根目录的 inode 内容，并依据该 inode 读取根目录的 block 内的文件名数据，再一层一层的往下读到正确的文件名。

    + root of directory tree -> inode id ->inode->blocks->file names


+ 非同步处理 （asynchronously） 
    + 更改文件时，文件先加载到内存中.改过文件，则内存中标识dirty,没改过则clean.系统不定时把dirty数据写入磁盘，保持数据一致。
        + 修改大文件时不会卡顿
    + `sync` 手动同步dirty数据到磁盘

+ Linux VFS （Virtual Filesystem Switch）

+ directory tree
    + linux内的所有数据都是文件
    + /  根目录为主

+ Sector(扇区) 存储的最小单位(512byte)
    + block 连续的多个扇区，文件存取的最小单位(4KB)

## ref

+ [理解linux中的file descriptor(文件描述符)](https://wiyi.org/linux-file-descriptor.html)
+ [Linux 文件权限概念](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/43.html)
+ [7.1 认识 Linux 文件系统](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/59.htmldd)
+ [硬链接(hard link)和符号连接(symbolic link)的区别](https://blog.51cto.com/wzgl08/308987)
+ [理解inode](https://www.ruanyifeng.com/blog/2011/12/inode.html)
+ [inode 索引节点](https://gnu-linux.readthedocs.io/zh/latest/Chapter03/00_inode.html)