# Pyspider


## install

+ python2.7
+ `pip install wheel`
+ `pip install lxml-3.4.4-cp27-none-win32.whl`   download [lxml](https://pypi.python.org/pypi/lxml/3.4.4)  cp27:cpython2.7
+ `pip install pyspider`
+ `pip install --allow-all-external pyspider[all]` 会安装pymongo, redis等python库
+ [phantomjs](http://phantomjs.org/download.html),配置bin到环境变量

## Cmd

+ `pyspider all`运行pyspider并启动它的所有组件 [http://localhost:5000](http://localhost:5000) 
+ `pyspider phantomjs`
+ `pyspider -c config.json`  启动pyspider，可配置mongodb,redis

## Detail

+ fetch_type='js' 

```py
# 执行js渲染页面，需要phantomjs
 self.crawl(each.attr.href, callback=self.detail_page,validate_cert=False,fetch_type='js')
```
+ request会放入队列中，自动去重重试，相同的taskid(相同的url)会被去重
+ [ResultWorker](http://docs.pyspider.org/en/latest/Working-with-Results/)

## Trouble shooting

+ issue: ssl certificate problem unable to get local issuer certificate

```py

# 添加 validate_cert=False
self.crawl(each.attr.href, callback=self.detail_page,validate_cert=False)

```

+ issue:mysql-connector-python>=1.2.2
```Cmd
git clone https://github.com/mysql/mysql-connector-python.git
python ./setup.py build
python ./setup.py install
```

+ python停止工作

pyspider只支持32位python，用于64位python时会异常

## Ref

+ [offical](http://docs.pyspider.org/en/latest/)
+ [pyquery](https://pythonhosted.org/pyquery/)
+ [pyspider 案例](http://cuiqingcai.com/2652.html)
+ [mongodb config](http://docs.pyspider.org/en/latest/Command-Line/#command-line)

