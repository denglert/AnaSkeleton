OBJ_Analyzer = ../lib/Zh-Analyzer.cpp.o $(OBJ_core)
OBJ_core = ../lib/GraphTools.cpp.o ../lib/UtilFunctions.cpp.o ../lib/config.cpp.o ../lib/AnalysisFW.cpp.o ../lib/AnalysisFW-Analyzer.cpp.o ../lib/GlobalConfig.cpp.o

../bin/Analyzer: $(OBJ_Analyzer)
	LD_LIBRARY_PATH=/home/de3u14/lib/links/libs $(CC) $^ $(CLFLAGS) -o $@

all : ../bin/Analyzer

####################
## -- Linking -- ###
####################

LIBDIRLINK = $(HOME)/lib/links/libs
INCDIRLINK = $(HOME)/lib/links/inc

#################
### -- C++ -- ###
#################

CC     = g++
#CC     = icc

C++11   = -std=c++11
WALL    = -Wall

CCFLAGS = -I../inc/ -I$(INCDIRLINK) $(ROOTCFLAGS) $(C++11) -MMD -MF .depend_cpp
CLFLAGS = $(DELPHES_LFLAGS) $(ROOTLFLAGS) 

# Delphes flags
DELPHES_LFLAGS = -L$(LIBDIRLINK) -lDelphes

# ROOT flags
ROOTCFLAGS = `root-config --cflags`

#WS_FLAG = MAC
WS_FLAG = IRIDIS

#ROOTLFLAGS = -L/home/de3u14/lib/links/libs/root/root -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread -lm -ldl
ROOTLFLAGS = -L/home/de3u14/lib/build/hep/ROOT/build/root_v5.34.36/lib/root -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread -lm -ldl -lEG

### General compilation rule for .cpp sources
../lib/%.cpp.o : %.cpp
	$(CC) $(CCFLAGS) -c $< -o $@

include .depend_cpp

clean : 
	rm ../lib/*
	rm    ./src/.depend_cpp
	touch ./src/.depend_cpp
