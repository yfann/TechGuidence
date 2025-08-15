

# RAID
+ 冗余独立磁盘阵列
+ Redundant Array of independent disks

## RAID 0
+ 数据均匀分配在磁盘上
+ 没有冗余

## RAID 1
+ 数据被分配到两个或更多的磁盘上


## RAID 5
+ 数据和奇偶校验信息分布在多个硬盘上。通常需要至少三块硬盘。

## RAID 5
+ 类似RAID 5，但使用双重奇偶校验信息，提供更强的容错能力。
+ 优点：即使两个硬盘同时故障，数据仍然可以恢复。
+ 缺点：写入性能进一步降低，存储效率较低。

## RAID 10
+ 结合了RAID 1的镜像和RAID 0的条带化，即先将数据镜像，然后再进行条带化。
+ 优点：提供高性能和冗余性。
+ 缺点：需要较多硬盘，存储效率较低

## tools
+ Syncthing
    + 自动同步

+ SMB（Server Message Block）
    + 网络文件共享协议，主要用于在局域网内共享文件、打印机和其他资源，可以让你的电脑像 NAS 一样提供共享目录
    + app
        + Documents by Readdle

        
+ 照片管理
    + Immich
    + PhotoPrism
        + web端照片管理


+ 影音
    + Plex
        + 外网可访问

+ music
    + Navidrome + DSub
        + Subsonic
    + [musicbrainz](https://picard.musicbrainz.org/)
        + 音乐库的自动化管理