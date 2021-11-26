

## install
+ `pip install -U Sphinx`

+ `pip install -U sphinx-panels`
+ `pip install -U sphinxcontrib-redoc`
+ `pip install sphinxcontrib-mermaid`
+ `pip install sphinxcontrib-images`
+ `pip install pydata_sphinx_theme`
+ `pip install sphinx-autobuild`
+ `pip install recommonmark`

## cmd
+ `sphinx-quickstart` 初始化
    + project folder下运行
    + 生成source directory
    + conf.py

+ `sphinx-autobuild source build/html --port 8090` 运行
    + project folder下运行



<!-- make -->
+ `make <target>` 
    + `make html` 生成html文件

## tips
+ html_theme = 'alabaster'
    + conf.py

## issues

+ '_NamespacePath' object has no attribute 'sort'
    + `pip install --upgrade pip setuptools`

+ OSError: [WinError 10013] An attempt was made to access a socket in a way forbidden by its access permissions
    + 端口被占,换端口
        + `sphinx-autobuild source build/html --port 8090`

## ref
+ [sphinx](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html)
+ [Sphinx简明教程](https://iridescent.ink/HowToMakeDocs/Basic/Sphinx.html)
+ [Sphinx初尝](https://sphinx-doc-zh.readthedocs.io/en/latest/tutorial.html)
<!-- detail -->
+ [conf.py](https://www.sphinx-doc.org/en/master/usage/configuration.html)
+ [HTML Theming](https://www.sphinx-doc.org/en/master/usage/theming.html)




<!-- plugin -->
+ [sphinx-panels](https://sphinx-panels.readthedocs.io/en/latest/)
+ [sphinxcontrib-redoc](https://sphinxcontrib-redoc.readthedocs.io/en/stable/)
+ [sphinxcontrib-mermaid](https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/)
+ [sphinxcontrib-images](https://sphinxcontrib-images.readthedocs.io/en/latest/)


<!-- other -->
+ [Read the Docs](https://readthedocs.org/)