# Inspired from https://github.com/TheoreticalEcosystemEcology/jekyll_ieLab/blob/master/makefile
DATA=data/*
CONT=content/*
STAT=static/*
TH=themes/*
SITE=public

.PHONY: server clean

$(SITE): $(DATA) $(CONT) $(STAT) $(TH)
	Rscript -e 'blogdown::build_site()'
	cd $(SITE) && lftp ftp://ammd.bios2.03832@bios2.recherche.usherbrooke.ca -e "mirror -e -R ; quit"

server:
	Rscript -e 'blogdown::serve_site()'

clean:
	rm -rf public
