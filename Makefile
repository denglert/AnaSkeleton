# - Analyzer
RUN_ANA_TAG        = test_dir
RUN_ANA_BINCONFIG  = ./config/bin.conf
RUN_ANA_COMPCONFIG = ./config/comp.conf
RUN_ANA_nEvents    = -1

VAR_RUN_ANA    = $(shell echo '$(.VARIABLES)' |  awk -v RS=' ' '/RUN_ANA_/' | sed 's/RUN_ANA_//g' )
EXPORT_RUN_ANA = $(foreach v,$(VAR_RUN_ANA),$(v)="$(RUN_ANA_$(v))")

all :

Analyzer : build
	@$(EXPORT_RUN_ANA) ./scripts/createWD.sh
	@./bin/Zh-Analyzer $(RUN_ANA_TAG) $(RUN_ANA_COMPCONFIG) $(RUN_ANA_BINCONFIG) $(RUN_ANA_nEvents)


test :
	@ echo "Test."
	@ echo $(VAR_RUN_ANA)
	@ echo $(EXPORT_RUN_ANA)

###############################

build : 
	@ cd src; make all 

clean :
	rm ./lib/*
