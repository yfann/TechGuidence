# alerta

+ Correlation(same environment-resource-event,different severity) -> severity change -> status change

## CLI

+ `pip3 install alerta`
    + `~/.alerta.conf`


+ `alertad run --port 8080`

+ `python -m http.server 8000`

## config for alerta server
+ /etc/alertad.conf
+ `export ALERTA_SVR_CONF_FILE=~/.alertad.conf`
+ `echo "BLACKOUT_DURATION = 86400" >$ALERTA_SVR_CONF_FILE`


## issues

+ No module named 'werkzeug.middleware'
    + `pip uninstall werkzeug`
    + `pip install werkzeug==0.16.0`


## ref

+ [alerta/alerta](https://github.com/alerta/alerta)


