#!/bin/bash

pip3 install telegram-send
echo "Follow instructions:"
telegram-send --configure
echo "Test it:"
telegram-send "hello, world"
