#!bin/bash

echo "[APPSTORE][Notability] installing ..."
mas install 736189492 && echo "installed: ✓"

echo "[APPSTORE][Bear] Installing..."
mas install 1091189122 && echo "installed: ✓"

hg clone https://alessandrosteri@bitbucket.org/rndblnch/osx-presentation
