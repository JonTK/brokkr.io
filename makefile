
help:
	@echo "Usage: make <command>"
	@echo "  serve   Serve the site for development"
	@echo "  build   Builds the site"
	@echo "  publish Publish the site on gh-pages"

server:
	hugo server --buildDrafts

build:
	rm -rf public
	hugo -d public

prepare:
	if [ ! -d "public" ]; \
	then \
		git clone git@github.com:jontk/brokkr.io --branch gh-pages public; \
	fi;

publish:
	make prepare
	rm -rf public/*
	hugo -d public
	cd public; \
	git add --all; \
	git commit -m "Released at $(shell date +'%Y.%m.%d %H:%M:%S')"; \
	git push;
