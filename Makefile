REGISTRY?=registry
DOCKERFILES=$(find * -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
DEPENDS=.depends.mk

all:
	@echo $(value DOCKERFILES)
	@echo $(value IMAGES)

