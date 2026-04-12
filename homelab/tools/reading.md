## rss-reading
+ install FreshRSS
```sh
docker run -d --restart unless-stopped --log-opt max-size=10m \
  -p 8080:80 \
  -e TZ=Europe/Paris \
  -e 'CRON_MIN=1,31' \
  -v freshrss_data:/var/www/FreshRSS/data \
  -v freshrss_extensions:/var/www/FreshRSS/extensions \
  --name freshrss \
  freshrss/freshrss
```


## ref
+ [FreshRSS](https://github.com/FreshRSS/FreshRSS/tree/edge/Docker)
+ [epub-tts](https://github.com/rafael1mc/epub-tts)
    + epub to voice