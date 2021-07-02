#!/bin/bash
# Build VIPS container
docker build -f buildtools/Dockerfile.libvips -t arlo.fail:libvips .
# Build Jekyll container & run it
docker build -f buildtools/Dockerfile.builder -t arlo.fail:builder .
docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/photo-stream/_site" arlo.fail:builder
sudo rm -rf $PWD/vendor/bundle/buildtools $PWD/vendor/bundle/README.md $PWD/vendor/bundle/Gemfile* $PWD/vendor/bundle/LICENSE $PWD/vendor/bundle/.git*
# Build nginx container
docker build -f buildtools/Dockerfile.nginx -t arlo.fail:nginx-amd64 --build-arg ARCH=amd64/ .
docker build -f buildtools/Dockerfile.nginx -t arlo.fail:nginx-arm64 --build-arg ARCH=arm64/ .