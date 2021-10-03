FROM ruby:3.0.2
WORKDIR /
COPY Gemfile /
COPY config.ru /
RUN bundle install
EXPOSE 8080
ENTRYPOINT ["bundle", "exec", "unicorn"]
