build:
	rm -rf build && mkdir build
	ruby blog.rb

clean:
	rm -rf build/*

watch:
	while true; do \
	ls -d .git/* * posts/* pages/* header.html | entr -cd make build ;\
	done

.PHONY: build clean watch
