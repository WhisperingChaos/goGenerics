#!/bin/bash
docker run -d --rm				\
  -v /tmp/.X11-unix:/tmp/.X11-unix		\
  -v "$(pwd)":/home/user/src			\
  -e DISPLAY=unix$DISPLAY			\
  markdown


