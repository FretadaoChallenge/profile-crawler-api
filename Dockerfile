FROM ruby:2.6.3-slim

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       postgresql \
                       build-essential \
                       postgresql-client \
                       postgresql-contrib \
                       libpq-dev \
                       curl \
                       git \
                       yarn

COPY . /profile-crawler

WORKDIR /profile-crawler

CMD ["sh","script/start.sh"]
