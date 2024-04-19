#!/bin/sh

mkdir jupyter && cd jupyter

python3 -m venv my_env

source ./my_env/bin/activate

pip3 install jupyter notebook

echo "jupyter ALL=(ALL) NOPASSWD: /usr/local/sbin/jupyter" >> /etc/sudoers

jupyter notebook --allow-root --ip=0.0.0.0 --port=8888
