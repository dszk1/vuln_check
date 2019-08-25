FROM ruby:2.5.3
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /vuln_check
WORKDIR /vuln_check

ADD Gemfile /vuln_check/Gemfile
ADD Gemfile.lock /vuln_check/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /vuln_check
