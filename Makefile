build:
	rm -rf build && mkdir build
	sh ./barf
	rsync -r public/ build/public
	rsync style.css build/style.css

clean:
	rm -rf build/*

watch:
	while true; do \
	ls -d .git/* * posts/* pages/* header.html | entr -cd make build ;\
	done

.PHONY: build clean watch
