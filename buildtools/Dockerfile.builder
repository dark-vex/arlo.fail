# Setup builder
FROM arlo.fail:libvips

COPY ./ /photo-stream 

WORKDIR /photo-stream

RUN ruby -v && gem install bundler jekyll && bundle install

ENTRYPOINT bundle exec jekyll build




