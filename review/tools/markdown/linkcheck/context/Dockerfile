# ARG feature allowing tag substitution, in FROM statement, first introduced in Docker 17.05.0.
# Therefore, this Dockerfile will not work with Docker versions prior to it.
ARG ARG_VER_DEBIAN_TAREXTRACT=9.4
ARG ARG_VER_NODE=13.2.0-stretch
FROM debian:${ARG_VER_DEBIAN_TAREXTRACT} AS tar_extract
COPY v3.8.0 /tar/
RUN mkdir /tar/extract     \
 && cd /tar/extract        \
 && tar --strip-components=1 -xvf /tar/v3.8.0

FROM node:${ARG_VER_NODE}
# Install app dependencies
COPY --from=tar_extract /tar/extract/package.json /src/package.json
WORKDIR /src
RUN set -ex; \
    npm install \
    && npm ls
# Bundle app source
COPY --from=tar_extract /tar/extract /src
RUN npm test
ENTRYPOINT [ "/src/markdown-link-check" ]
