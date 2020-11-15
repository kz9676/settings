#!/bin/bash - 

#===============================================================================
#
#          FILE: configure.sh
#         USAGE: bash ./configure.sh 
#   DESCRIPTION: Custom Vim configuration. 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kostya Zolotarov (KZ), <kostya.zolotarov@gmail.com>
#       CREATED: 2020-11-14 15:56
#      REVISION: ---
#
#===============================================================================

author="Kostya Zolotarov (KZ), <kostya.zolotarov@gmail.com>"

./configure                         \
    --with-features=huge            \
    --enable-multibyte              \
    --enable-cscope                 \
    --enable-python3interp          \
    --with-python3-command=python3  \
    --enable-rubyinterp             \
    --with-compiledby="$author"     \

#===============================================================================
