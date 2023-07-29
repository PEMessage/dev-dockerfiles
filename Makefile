
DIR:=$(CURDIR)
DOCKERFILE:= $(wildcard *.dockerfile)
export PATH:= $(PATH):$(DIR)/bin

debug: $(DOCKERFILE)
	echo Current dir is $(CURDIR)
	echo Current file is $(DOCKERFILE)
	cp $< $(DIR)/test/dockerfile -f
	buildg --oci-worker-net auto debug test
build: $(DOCKERFILE)
	echo Current dir is $(CURDIR)
	echo Current file is $(DOCKERFILE)
	cp $< $(DIR)/build/dockerfile -f
	docker build $(DIR)/build
