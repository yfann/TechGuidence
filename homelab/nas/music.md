
## navidrome
+ install
    + `docker pull deluan/navidrome`

```bash
docker run -d \
--name navidrome \
--restart unless-stopped \
--user $(id -u):$(id -g) \
-v /volumes/SSD/navidrome/music:/music \
-v /volumes/SSD/navidrome/data:/data \
-p 4533:4533 \
-e ND_LOGLEVEL=info \
deluan/navidrome:latest
```
   + `http://localhost:4533`



+ Subsonic

## Amperfy
+ app store
+ iphone app


## spotdl
+ 下载spotify
+ install
    + `pip3 install spotdl --break-system-packages`
    + `spotdl --download-ffmpeg`

+ `spotdl [urls]`


## 网易ncm转mp3
+ `ncmdump -d <folder name>`
    + 文件夹里的ncm转为mp3
+ `ncmdump -m`
    + 删除原文件

## ref
<!-- 网易云 -->
+ [ncmdump](https://github.com/taurusxin/ncmdump)
<!-- 音乐播放 -->
+ [navidrome](https://www.navidrome.org/docs/installation/)
<!-- downloader -->
+ [spotify-downloader Public](https://github.com/spotDL/spotify-downloader)
+ [zotify](https://github.com/zotify-dev/zotify)
+ [spotidownloader](https://spotidownloader.com/en)