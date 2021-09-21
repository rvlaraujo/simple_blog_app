FROM ruby:3.0.2-alpine3.14

# install Ruby on Rails 6
RUN apk update \
  && apk add --update --no-cache \
    build-base \
    curl-dev \
    git \
    sqlite-dev \
    yaml-dev \
    zlib-dev \
    nodejs \
    yarn

ENV RAILS_ENV=development
ENV NODE_ENV=development

WORKDIR /simple_blog_app
COPY Gemfile /simple_blog_app/Gemfile
COPY Gemfile.lock /tmp/Gemfile.lock
RUN gem install bundler --no-document
RUN bundle config --local disable_platform_warnings true
RUN bundle install --no-binstubs --jobs $(nproc)
COPY . /simple_blog_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "sh", "/usr/bin/entrypoint.sh" ]
EXPOSE 3000

CMD ["rails", "server", "--binding", "0.0.0.0"]