#!/bin/bash
set -e
docker build                  \
  -t markdown_link_checker    \
  -f ./context/Dockerfile     \
  ./context/tar
