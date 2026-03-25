# pyenv
+ 管理多个版本python


## mac 
+ `brew install pyenv`
```sh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
source ~/.zshrc
```
+ `pyenv install 3.11.8`

+ `pyenv global 3.11.8`

+ `python -m venv venv`
+ `source venv/bin/activate`