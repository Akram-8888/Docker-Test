FROM ruby:2.7.1

LABEL maintainer="Bogumil Wrona <bogumil@code-pan.com>"

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

RUN gem update --system 3.3.22

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler -v 2.3.22
RUN bundle _2.3.22_ install --jobs 4 --retry 3

COPY . /app

EXPOSE 3001

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3001"]
