### CONFIG 
#########################################
SHEETS=$(notdir $(basename $(wildcard $(SHDIR)/*.tex)))


## Paths
TOPDIR=./
EXDIR=$(TOPDIR)/Exercises
SHDIR=$(TOPDIR)/Sheets
OUTDIR=$(TOPDIR)/Compiled
TEXDIR=$(TOPDIR)/latex

## Targets/Dependencies
EXCER:=$(wildcard $(EXDIR)/*.tex)
WKDIRS:=$(addprefix "workdir_",$(SHEETS))
EXTARGETS:=$(addsuffix .pdf,$(addprefix $(OUTDIR)/,$(SHEETS)))
SOLTARGETS:=$(addsuffix _sol.pdf,$(addprefix $(OUTDIR)/,$(SHEETS)))
TEX:=$(wildcard $(TEXDIR)/*)

### RULES
#########################################
.PHONY: all clean clobber
all: $(EXTARGETS) $(SOLTARGETS) 

## build working dir
$(WKDIR): 
	mkdir $@

## build sheet (no solutions)
$(OUTDIR)/%.pdf: $(SHDIR)/%.tex $(EXCER) $(TEX)
	$(eval TARGET := $(basename $(notdir $@)))
	$(eval WKDIR  := workdir_$(TARGET))
	if [ ! -d "$(WKDIR)" ]; then mkdir $(WKDIR); fi
	pdflatex -output-directory=$(WKDIR) "\let\ifwithsolution\iffalse\input{$(SHDIR)/$(TARGET)}" 
	pdflatex -output-directory=$(WKDIR) "\let\ifwithsolution\iffalse\input{$(SHDIR)/$(TARGET)}" 
	if [ ! -d "$(OUTDIR)" ]; then mkdir $(OUTDIR); fi
	mv $(WKDIR)/$(TARGET).pdf $(OUTDIR)/.

## build sheet (with solutions)
$(OUTDIR)/%_sol.pdf: $(SHDIR)/%.tex $(EXCER) $(TEX)
	$(eval TARGET := $(subst _sol.pdf,,$(notdir $@)))
	$(eval WKDIR  := workdir_$(TARGET))
	if [ ! -d "$(WKDIR)" ]; then mkdir $(WKDIR); fi
	pdflatex -output-directory=$(WKDIR) -jobname=$(TARGET)_sol "\let\ifwithsolution\iftrue\input{$(SHDIR)/$(TARGET)}" 
	pdflatex -output-directory=$(WKDIR) -jobname=$(TARGET)_sol "\let\ifwithsolution\iftrue\input{$(SHDIR)/$(TARGET)}" 
	if [ ! -d "$(OUTDIR)" ]; then mkdir $(OUTDIR); fi
	mv $(WKDIR)/$(TARGET)_sol.pdf $(OUTDIR)/.


clean: 
	rm -rf $(WKDIRS) $(EXTARGETS) $(SOLTARGETS) 

clobber: clean
	rm -rf $(OUTDIR)
