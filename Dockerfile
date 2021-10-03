FROM ruby:3.0.2
WORKDIR ~/
RUN git clone https://github.com/Yukariko/prometheus-client-ruby.git
WORKDIR ~/prometheus-client-ruby
RUN bundle install
ENTRYPOINT ["bundle", "exec", "unicorn"]
