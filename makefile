# Inspired from https://github.com/TheoreticalEcosystemEcology/jekyll_ieLab/blob/master/makefile
DATA=data
CONT=content
STAT=static
TH=themes
FILES := $(shell find $(DATA) $(CONT) $(STAT) $(TH) -type f)

.PHONY: server clean deploy

deploy: site
	lftp ftp://ammd.bios2.03832@bios2.recherche.usherbrooke.ca -e "mirror -e -R public ; quit"

site: $(FILES)
	Rscript -e 'blogdown::build_site()'

server:
	Rscript -e 'blogdown::serve_site()'

clean:
	rm -rf public
