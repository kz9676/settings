#=========================================================================
#
#     Filename: Makefile
#  Description:
#
#        Usage: make           (generate executable                      )
#               make clean     (remove objects, executable, prerequisits )
#               make tarball   (generate compressed archive              )
#               make zip       (generate compressed archive              )
#
#      Version: 1.0
#      Created: 
#     Revision: 
#
#       Author: 
#      Company: 
#        Email: 
#
#        Notes: This is a GNU make (gmake) makefile.
#               C   extension   :  c
#               C++ extensions  :  cc cpp C
#               C and C++ sources can be mixed.
#               Prerequisites are generated automatically; makedepend is
#               not needed (see documentation for GNU make Version 3.81,
#               April 2006, section 4.13). The utility sed is used.
#
#========================================================================

# DEBUG can be set to YES to include debugging info, or NO otherwise
DEBUG              := YES

# PROFILE can be set to YES to include profiling info, or NO otherwise
PROFILE            := NO

# Executable       -------------------------------------------------------
EXECUTABLE         := main

# Sources          -------------------------------------------------------
SOURCES            := main.c 

# Compiler         -------------------------------------------------------
CC                 := gcc
CXX                := g++

# Compiler flags   -------------------------------------------------------
DEBUG_CFLAGS       := -Wall -ansi -pedantic -O0 -g
RELEASE_CFLAGS     := -Wall -ansi -pedantic -O3

# Linker flags     -------------------------------------------------------
DEBUG_LDFLAGS      := -g
RELEASE_LDFLAGS    :=

# System includes  -------------------------------------------------------
GLOBAL_INC_DIR     =

# Local includes   -------------------------------------------------------
LOCAL_INC_DIR      = $(HOME)/include

# System libs      -------------------------------------------------------
SYS_LIBS           = -lm

# Global libs      -------------------------------------------------------
GLOBAL_LIB_DIR     =

# Global libs      -------------------------------------------------------
GLOBAL_LIBS        =

# Local libs       -------------------------------------------------------
LOCAL_LIB_DIR      = $(HOME)/lib

# Local libs       -------------------------------------------------------
LOCAL_LIBS         =

# Archive          -------------------------------------------------------
TARBALL_EXCLUDE    = *.{o,gz,zip}
ZIP_EXCLUDE        = *.{o,gz,zip}

# Run executable   -------------------------------------------------------
EXE_START          = no # (yes/no)

# Options          -------------------------------------------------------
EXE_CMDLINE        =

#=========================================================================

ifeq (YES, ${DEBUG})
  CFLAGS       := ${DEBUG_CFLAGS}
  CXXFLAGS     := ${DEBUG_CXXFLAGS}
  LDFLAGS      := ${DEBUG_LDFLAGS}
else
  CFLAGS       := ${RELEASE_CFLAGS}
  CXXFLAGS     := ${RELEASE_CXXFLAGS}
  LDFLAGS      := ${RELEASE_LDFLAGS}
endif

ifeq (YES, ${PROFILE})
  CFLAGS       := ${CFLAGS}   -pg -O3
  CXXFLAGS     := ${CXXFLAGS} -pg -O3
  LDFLAGS      := ${LDFLAGS}  -pg
endif

C_SOURCES       = $(filter     %.c, $(SOURCES))
CPP_SOURCES     = $(filter-out %.c, $(SOURCES))
ALL_INC_DIR     = $(addprefix -I, $(LOCAL_INC_DIR) $(GLOBAL_INC_DIR))
ALL_LIB_DIR     = $(addprefix -L, $(LOCAL_LIB_DIR) $(GLOBAL_LIB_DIR))
GLOBAL_LIBSS    = $(addprefix $(GLOBAL_LIB_DIR)/, $(GLOBAL_LIBS))
LOCAL_LIBSS     = $(addprefix $(LOCAL_LIB_DIR)/, $(LOCAL_LIBS))
ALL_CFLAGS      = $(CFLAGS) $(ALL_INC_DIR)
ALL_LFLAGS      = $(LDFLAGS) $(ALL_LIB_DIR)
BASENAMES       = $(basename $(SOURCES))

# Object files  ----------------------------------------------------------
OBJECTS         = $(addsuffix .o,$(BASENAMES))

# Prerequisites ----------------------------------------------------------
PREREQUISITES   = $(addprefix .,$(addsuffix .d,$(BASENAMES)))

# Executable    ----------------------------------------------------------
$(EXECUTABLE):	$(OBJECTS)
ifeq ($(strip $(CPP_SOURCES)),)
								$(CC)  $(ALL_LFLAGS) -o $(EXECUTABLE) $(OBJECTS) $(LOCAL_LIBSS) $(GLOBAL_LIBSS) $(SYS_LIBS)
else
								$(CXX) $(ALL_LFLAGS) -o $(EXECUTABLE) $(OBJECTS) $(LOCAL_LIBSS) $(GLOBAL_LIBSS) $(SYS_LIBS)
endif
ifeq ($(EXE_START),yes)
								./$(EXECUTABLE) $(EXE_CMDLINE)
endif

# Archive       ----------------------------------------------------------
ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),tarball)
ifneq ($(MAKECMDGOALS),zip)
-include         $(PREREQUISITES)
endif
endif
endif

# Objects       ----------------------------------------------------------
%.o:		%.c
				$(CC)  -c $(ALL_CFLAGS) $<

%.o:		%.cc
				$(CXX) -c $(ALL_CFLAGS) $<

%.o:		%.cpp
				$(CXX) -c $(ALL_CFLAGS) $<

%.o:		%.C
				$(CXX) -c $(ALL_CFLAGS) $<

# Prerequisites  ---------------------------------------------------------
.%.d:   %.c
				@$(make-prerequisite-c)

.%.d:		%.cc
				@$(make-prerequisite-cplusplus)

.%.d:		%.cpp
				@$(make-prerequisite-cplusplus)

.%.d:		%.C
				@$(make-prerequisite-cplusplus)

# Commands       ---------------------------------------------------------
define	make-prerequisite-c
				@$(CC)   -MM $(ALL_CFLAGS) $< > $@.$$$$;            \
				sed 's/\($*\)\.o[ :]*/\1.o $@ : /g' < $@.$$$$ > $@; \
				rm -f $@.$$$$;
endef

define	make-prerequisite-cplusplus
				@$(CXX)  -MM $(ALL_CFLAGS) $< > $@.$$$$;            \
				sed 's/\($*\)\.o[ :]*/\1.o $@ : /g' < $@.$$$$ > $@; \
				rm -f $@.$$$$;
endef

# Clean          ---------------------------------------------------------
clean:
								-rm  --force  $(EXECUTABLE) $(OBJECTS) $(PREREQUISITES) *~

# Tarball        ---------------------------------------------------------
tarball:
					@lokaldir=`pwd`; lokaldir=$${lokaldir##*/}; \
					rm --force $$lokaldir.tar.gz;               \
					tar --exclude=$(TARBALL_EXCLUDE)            \
					    --exclude=$(EXECUTABLE)                 \
					    --create                                \
					    --gzip                                  \
					    --verbose                               \
					    --file  $$lokaldir.tar.gz *

# Zip            ---------------------------------------------------------
zip:
					@lokaldir=`pwd`; lokaldir=$${lokaldir##*/}; \
					zip -r  $$lokaldir.zip * -x $(ZIP_EXCLUDE) -x ${EXECUTABLE}

.PHONY: clean tarball zip

# ========================================================================
# vim: set tabstop=2: set shiftwidth=2:
