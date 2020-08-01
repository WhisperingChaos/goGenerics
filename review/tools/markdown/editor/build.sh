#!/bin/bash
set -e
docker build								\
	-t basemarkdown							\
	--build-arg 'VER_DEBIAN=9.4'					\
	--build-arg 'PKG_NAME_VER_VSCODE=code=1.30.0-1544567151'	\
	./context

docker build								\
	-t markdown							\
	-f ./context/Markdown						\
	./context
