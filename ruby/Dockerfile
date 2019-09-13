FROM ruby:latest
WORKDIR /code
RUN gem install sinatra
COPY . .
CMD ["ruby", "myapp.rb", "-o", "0.0.0.0"]
