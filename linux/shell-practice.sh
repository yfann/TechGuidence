# script
while true; do curl http://localhost:8080/;sleep .5;done

# text edit
echo 'MWYyZDFlMmU2N2Rm' | base64 --decode
echo "xxxx" >> ~/.zshrc
sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy


echo "foo" | sudo tee /etc/my.cfg # Overwrite: Equivalent of echo "foo" > /etc/my.cnf
echo "foo" | sudo tee -a /etc/my.cfg # Append: Equivalent of echo "foo" >> /etc/my.cnf
sudo bash -c 'echo "foo" > /etc/my.cnf'



## shell variables
var=$(cat file; printf x)
echo "$var test"
    # + 必须为双引号
    # + 单引号直接输出$var
    # + 不加引号,变量会field splitting,pathname expansion