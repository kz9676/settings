#!/bin/bash - 

#===============================================================================
#
#          FILE: configure.sh
#         USAGE: bash ./configure.sh 
#   DESCRIPTION: Custom Vim configuration. 
#        AUTHOR: Kostya Zolotarov, <kostya.zolotarov@gmail.com>
#       CREATED: 2020-11-14 15:56
#
#===============================================================================

author="Kostya Zolotarov, <kostya.zolotarov@gmail.com>"

./configure                         \
    --with-features=huge            \
    --enable-multibyte              \
    --enable-cscope                 \
    --enable-python3interp          \
    --with-python3-command=python3  \
    --enable-rubyinterp             \
    --with-compiledby="$author"     \

#===============================================================================
