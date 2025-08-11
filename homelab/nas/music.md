
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




## ref
+ [navidrome](https://www.navidrome.org/docs/installation/)
+ [spotify-downloader Public](https://github.com/spotDL/spotify-downloader)

