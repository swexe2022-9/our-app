FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs      

RUN mkdir /app_name 

ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler 
RUN gem install nokogiri --platform=ruby

ADD . $APP_ROOT
RUN bundle install

RUN bundle config set force_ruby_platform true