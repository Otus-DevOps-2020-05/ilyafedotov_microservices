FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler

COPY reddit /reddit
COPY gitlab-ci/docker/mongod.conf /etc/mongod.conf
COPY gitlab-ci/docker/db_config /reddit/db_config
COPY gitlab-ci/docker/start.sh /start.sh

RUN cd /reddit && rm Gemfile.lock && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]
