FROM ruby:2.7.0

RUN apt-get update 

# Upgrade node version
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g -y yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN gem install bundler:2.2.29
RUN bundle install
RUN rails webpacker:install

RUN rails db:migrate
run rails db:seed
RUN rails test

CMD rails s -b 0.0.0.0 