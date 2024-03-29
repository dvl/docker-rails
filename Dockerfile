FROM ruby:2.2

RUN apt-get update && apt-get install -y \
              nodejs \
              postgresql-client libpq-dev \
      --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
