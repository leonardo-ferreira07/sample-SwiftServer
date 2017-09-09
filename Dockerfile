# an image with the Swift toolchain + nano
FROM swift:latest

RUN apt-get -q update; \
    apt-get -q install -y nano
