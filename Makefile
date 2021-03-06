# Makefile for GCC builds on Cygwin.
#
# The MIT License (MIT)
#
# Copyright (c) 2020 Kostya Zolotarov
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

all: build 

PRJ         = $(notdir $(CURDIR))
PRJ.ENV     = .
PRJ.DIR.INC = $(PRJ.ENV)/include
PRJ.DIR.SRC = $(PRJ.ENV)/src
PRJ.DIR.BIN = $(PRJ.ENV)/bin
PRJ.DIR.LIB = $(PRJ.ENV)/lib
PRJ.DIR.ETC = $(PRJ.ENV)/etc
PRJ.DIR.DOC = $(PRJ.ENV)/doc
PRJ.DIR.LOG = $(PRJ.ENV)/log
PRJ.INC     = $(PRJ.DIR.INC)/$(PRJ)
PRJ.SRC     = $(PRJ.DIR.SRC)/$(PRJ)
PRJ.BIN     = $(PRJ.DIR.BIN)/$(PRJ)
PRJ.LIB     = $(PRJ.DIR.LIB)/$(PRJ)
PRJ.ETC     = $(PRJ.DIR.ETC)/$(PRJ).conf
PRJ.DOC     = $(PRJ.DIR.ETC)/$(PRJ).txt

SYS.ENV     = $(HOME)/.local
SYS.DIR.INC = $(SYS.ENV)/include
SYS.DIR.SRC = $(SYS.ENV)/src
SYS.DIR.BIN = $(SYS.ENV)/bin
SYS.DIR.LIB = $(SYS.ENV)/lib
SYS.DIR.ETC = $(SYS.ENV)/etc
SYS.DIR.DOC = $(SYS.ENV)/doc
SYS.DIR.LOG = $(SYS.ENV)/log
SYS.INC     = $(SYS.DIR.INC)/$(PRJ)
SYS.SRC     = $(SYS.DIR.SRC)/$(PRJ)
SYS.BIN     = $(SYS.DIR.BIN)/$(PRJ)
SYS.LIB     = $(SYS.DIR.LIB)/$(PRJ)
SYS.ETC     = $(SYS.DIR.ETC)/$(PRJ).conf
SYS.DOC     = $(SYS.DIR.ETC)/$(PRJ).txt

setup:
	@if [ ! -d $(PRJ.DIR.INC) ]; then mkdir -pv $(PRJ.DIR.INC); fi
	@if [ ! -d $(PRJ.DIR.SRC) ]; then mkdir -pv $(PRJ.DIR.SRC); fi
	@if [ ! -d $(PRJ.DIR.BIN) ]; then mkdir -pv $(PRJ.DIR.BIN); fi
	@if [ ! -d $(PRJ.DIR.LIB) ]; then mkdir -pv $(PRJ.DIR.LIB); fi
	@if [ ! -d $(PRJ.DIR.ETC) ]; then mkdir -pv $(PRJ.DIR.ETC); fi
	@if [ ! -d $(PRJ.DIR.DOC) ]; then mkdir -pv $(PRJ.DIR.DOC); fi
	@if [ ! -d $(PRJ.DIR.LOG) ]; then mkdir -pv $(PRJ.DIR.LOG); fi

build: setup

list:
	@if [ -d $(PRJ.DIR.INC) ]; then ls -d $(PRJ.DIR.INC); ls -a $(PRJ.DIR.INC); fi
	@if [ -d $(PRJ.DIR.SRC) ]; then ls -d $(PRJ.DIR.SRC); ls -a $(PRJ.DIR.SRC); fi
	@if [ -d $(PRJ.DIR.BIN) ]; then ls -d $(PRJ.DIR.BIN); ls -a $(PRJ.DIR.BIN); fi
	@if [ -d $(PRJ.DIR.LIB) ]; then ls -d $(PRJ.DIR.LIB); ls -a $(PRJ.DIR.LIB); fi
	@if [ -d $(PRJ.DIR.ETC) ]; then ls -d $(PRJ.DIR.ETC); ls -a $(PRJ.DIR.ETC); fi
	@if [ -d $(PRJ.DIR.DOC) ]; then ls -d $(PRJ.DIR.DOC); ls -a $(PRJ.DIR.DOC); fi
	@if [ -d $(PRJ.DIR.LOG) ]; then ls -d $(PRJ.DIR.LOG); ls -a $(PRJ.DIR.LOG); fi
	@if [ -d $(SYS.DIR.INC) ]; then ls -d $(SYS.DIR.INC); ls -a $(SYS.DIR.INC); fi
	@if [ -d $(SYS.DIR.SRC) ]; then ls -d $(SYS.DIR.SRC); ls -a $(SYS.DIR.SRC); fi
	@if [ -d $(SYS.DIR.BIN) ]; then ls -d $(SYS.DIR.BIN); ls -a $(SYS.DIR.BIN); fi
	@if [ -d $(SYS.DIR.LIB) ]; then ls -d $(SYS.DIR.LIB); ls -a $(SYS.DIR.LIB); fi
	@if [ -d $(SYS.DIR.ETC) ]; then ls -d $(SYS.DIR.ETC); ls -a $(SYS.DIR.ETC); fi
	@if [ -d $(SYS.DIR.DOC) ]; then ls -d $(SYS.DIR.DOC); ls -a $(SYS.DIR.DOC); fi
	@if [ -d $(SYS.DIR.LOG) ]; then ls -d $(SYS.DIR.LOG); ls -a $(SYS.DIR.LOG); fi

test:

package:

install:
	@if [ ! -d $(SYS.DIR.INC) ]; then mkdir -p $(SYS.DIR.INC); fi
	@if [ ! -d $(SYS.DIR.SRC) ]; then mkdir -p $(SYS.DIR.SRC); fi
	@if [ ! -d $(SYS.DIR.BIN) ]; then mkdir -p $(SYS.DIR.BIN); fi
	@if [ ! -d $(SYS.DIR.LIB) ]; then mkdir -p $(SYS.DIR.LIB); fi
	@if [ ! -d $(SYS.DIR.ETC) ]; then mkdir -p $(SYS.DIR.ETC); fi
	@if [ ! -d $(SYS.DIR.DOC) ]; then mkdir -p $(SYS.DIR.DOC); fi
	@if [ ! -d $(SYS.DIR.LOG) ]; then mkdir -p $(SYS.DIR.LOG); fi
	@if [ -f $(PRJ.INC) ]; then cp -fv $(PRJ.INC) $(SYS.DIR.INC); fi
	@if [ -f $(PRJ.BIN) ]; then cp -fv $(PRJ.BIN) $(SYS.DIR.BIN); fi
	@if [ -f $(PRJ.LIB) ]; then cp -fv $(PRJ.LIB) $(SYS.DIR.LIB); fi
	@if [ -f $(PRJ.ETC) ]; then cp -fv $(PRJ.ETC) $(SYS.DIR.ETC); fi
	@if [ -f $(PRJ.DOC) ]; then cp -fv $(PRJ.DOC) $(SYS.DIR.DOC); fi

uninstall:
	@if [ -f $(SYS.INC) ]; then rm -fv $(SYS.INC); fi
	@if [ -f $(SYS.BIN) ]; then rm -fv $(SYS.BIN); fi
	@if [ -f $(SYS.LIB) ]; then rm -fv $(SYS.LIB); fi
	@if [ -f $(SYS.ETC) ]; then rm -fv $(SYS.ETC); fi
	@if [ -f $(SYS.DOC) ]; then rm -fv $(SYS.DOC); fi

clean:
	@if [ -d $(PRJ.DIR.BIN) ]; then rm -rfv $(PRJ.DIR.BIN); fi
	@if [ -d $(PRJ.DIR.LIB) ]; then rm -rfv $(PRJ.DIR.LIB); fi
	@if [ -d $(PRJ.DIR.LOG) ]; then rm -rfv $(PRJ.DIR.LOG); fi

help:
	@echo "Commands: setup, build, list, test, package, install, uninstall, clean, help."

