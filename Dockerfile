FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /stevedocs_basic_v2
WORKDIR /stevedocs_basic_v2
ADD Gemfile /stevedocs_basic_v2/Gemfile
ADD Gemfile.lock /stevedocs_basic_v2/Gemfile.lock
RUN bundle install
ADD . /stevedocs_basic_v2