

sudo pip install jedi
sudo pip3 install jedi
sudo pip2 install -U setuptools
sudo pip3 install -U setuptools
sudo pip2 install 'python-language-server[all]'
sudo pip3 install 'python-language-server[all]'

pip3 install pyls-mypy

nvim +PlugInstall +UpdateRemotePlugins +qa

# gitcheck
pip3 install colored
sudo pip3 install git+git://github.com/badele/gitcheck.git

npm i -g bash-language-server
# callable with trash and rm is muted by aliases
brew install rmtrash

#git large file storage
brew install git-lfs

##################
# write:
## [pycodestyle]
## ignore = E501, E701
## exclude = .git,__init__.py
## max-line-length = 80
# in ~/.config/pycodestyle, the warnings from pyls are gone.
