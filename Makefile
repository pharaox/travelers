NAME := travelers
VERSION := $(shell cat VERSION)

.PHONY: tiger
tiger:
	ck3-tiger --no-color . > ck3-tiger.out
	cat ck3-tiger.out

.PHONY: build
build: clean
	mkdir -p tmp/$(NAME)
	rsync -r --exclude=".*" --exclude=tmp --exclude=images --exclude=misc --exclude=Makefile --exclude=description.txt --exclude=LICENSE.md --exclude=VERSION --exclude=ck3-tiger.conf . tmp/$(NAME)
	cp descriptor.mod tmp/$(NAME).mod
	echo "path=\"mod/$(NAME)\"" >> tmp/$(NAME).mod
	cd tmp && zip -r $(NAME)-$(VERSION).zip . && cd ..

.PHONY: clean
clean:
	rm -rf tmp
	rm -f ck3-tiger.out

.PHONY: thumbnail
thumbnail:
	convert images/Marco_Polo_with_elephants_and_camels_arriving_at_Hormuz_on_the_Gulf_of_Persia_from_India.jpeg -crop 1368x1368+240+85 +repage -resize 1024x1024^ -gravity center -extent 1024x1024 thumbnail.png

.PHONY: update-version
update-version:
	sed -i 's/$(VERSION)/$(NEW_VERSION)/g' descriptor.mod VERSION
