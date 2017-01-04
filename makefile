
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

publish:
	cd public; \
	ls -al; \
	git init; \
	git remote add origin git@github.com:jontk/brokkr.io; \
	git checkout -b gh-pages; \
	git add --all; \
	git commit -m "GitHub Pages Upload"; \
	git push -f origin gh-pages;
