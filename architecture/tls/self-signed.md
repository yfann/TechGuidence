

## flow


     ┌────────────┐              ┌───────────┐
     │ rootCA.key ├──────────────►rootCA.crt ├────────────────────────────────────────────┐
     └────────────┘              └───────────┘                                            │
                                                                                          │
                                                                                          │
           ┌────────────┐       ┌──────────────────────────────────┐                      │
           │myDomain.key├───────►     myDomain.csr                 │                ┌─────▼──────┐
           └────────────┘       │(common name/CN:IP or domain name)├────────────────►myDoamin.crt│
                                └──────────────────────────────────┘                └────────────┘

## cmd
<!-- generate root ca -->
+ `openssl req -newkey rsa:2048 -x509 -nodes -keyout ecs59_ca.key -new -out ecs59_ca.crt -subj /CN=Hostname -reqexts SAN -extensions SAN -config <(cat /etc/ssl/openssl.cnf  <(printf '[SAN]\nsubjectAltName=DNS:hostname,IP:172.16.8.59'))  -sha256 -days 3650`

<!-- crt to pem -->
+ `openssl x509 -in mycert.crt -out mycert.pem -outform PEM`


## tips
+ `CA_cert.pem` This certificate must be added to the browser local authority storage to make trust all certificates that created with using this CA.
+ `localhost_cert.pem`  SSL certificate. Must be installed at WEB server.





## ref
+ [self-signed-certificate-with-custom-ca.md](https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309)
+ [How to create a self-signed (or signed by own CA) SSL certificate for IP address that pass Chrome requirements](https://stackoverflow.com/questions/66558788/how-to-create-a-self-signed-or-signed-by-own-ca-ssl-certificate-for-ip-address)
+ [OpenSSL自签发配置有多域名或ip地址的证书](https://blog.csdn.net/u013066244/article/details/78725842)
+ [Self Signed SSL/TLS Certificate with IP Address](https://nodeployfriday.com/posts/self-signed-cert/)
+ [OpenSSL 自建CA及签发证书](https://blog.csdn.net/scuyxi/article/details/54898870)
