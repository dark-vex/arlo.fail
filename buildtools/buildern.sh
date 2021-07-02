#!/bin/bash

# Build Jekyll container & run it
docker build -f buildtools/Dockerfile.builder -t arlo.fail:builder .
docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/photo-stream/_site" arlo.fail:builder
sudo rm -rf $PWD/vendor/bundle/buildtools $PWD/vendor/bundle/README.md $PWD/vendor/bundle/Gemfile* $PWD/vendor/bundle/LICENSE $PWD/vendor/bundle/.git*
