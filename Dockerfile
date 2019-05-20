FROM ruby:2.5.1

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

# path
ENV INSTALL_PATH /onebitexchange

# create directory
RUN mkdir -p $INSTALL_PATH

# path + directory
WORKDIR $INSTALL_PATH

# path for the gems
ENV BUNDLE_PATH /gems

# copy code into container
COPY . .