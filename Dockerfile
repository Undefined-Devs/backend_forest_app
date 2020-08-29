FROM ruby:2.7.1

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir -p /home/app
WORKDIR /home/app

COPY ./Gemfile ./
COPY ./Gemfile.lock ./
#RUN gem install rails:6.0.2
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY ./ ./
#COPY docker-entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/docker-entrypoint.sh
#ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3000
#RUN ["rm", "-f", "./tmp/pids/server.pid"]

# Set Rails to run in production
# ENV RAILS_ENV production 
# ENV RACK_ENV production
# ENV RAILS_SERVE_STATIC_FILES true
# ENV RAILS_LOG_TO_STDOUT true
RUN ls
#RUN bundle exec rake SECRET_KEY_BASE=shonka  assets:precompile
# Start the main process.
#CMD [ "bash"]
CMD [ "rails", "s", "-b", "0.0.0.0"]
