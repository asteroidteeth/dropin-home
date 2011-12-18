#!/usr/bin/bash

find . -maxdepth 1 \( ! -name copy_all.sh -a ! -name vimwikiqrc.pdf -a ! -name .git -a ! -name . -a ! -name .gitignore \) -exec cp -rf "{}" ~ \;
