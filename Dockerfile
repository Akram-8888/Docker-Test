FROM ruby:2.7.1

MAINTAINER Bogumil Wrona <bogumil@code-pan.com>

RUN mkdir /app
WORKDIR /app

# Upgrade RubyGems to meet ffi dependency requirement
RUN gem update --system 3.3.22

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.3.22
RUN bundle _2.3.22_ install

ADD . /app
