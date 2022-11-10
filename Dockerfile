FROM ruby:3-alpine
WORKDIR /app
COPY . .
RUN apk add --no-cache build-base tzdata nodejs yarn sqlite-dev postgresql-dev mysql-dev
RUN gem install bundler
RUN bundle install
ENV RAILS_ENV=production
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
