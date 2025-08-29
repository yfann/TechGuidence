+ `openssl genrsa -out rootCA.key 4096`

+ `openssl req -new -sha256 -key rootCA.key -nodes -out rootCA.csr -config rootCA_openssl.conf`

+ `openssl x509 -req -days 3650 -extfile rootCA_openssl.conf -extensions v3_ca -in rootCA.csr -signkey rootCA.key -out rootCA.pem`

+ `openssl req -out ecs131.csr -newkey rsa:2048 -nodes -keyout ecs131.key -config config.conf`

+ `openssl x509 -req -sha256 -days 365 -CA rootCA.pem -CAkey rootCA.key  -set_serial 0 -in ecs131.csr -out ecs131.crt`


## tips

+ rootCA_openssl.conf中的`basicConstraints= CA:TRUE`必须否则，java端CA验证不成功

+ config.conf is example of binding ip for certificate