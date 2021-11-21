FROM osgeo/gdal:ubuntu-full-latest
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | -E bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN apt update && apt install -y yarn
WORKDIR /usr/app
COPY ["yarn.lock","package.json"] .
RUN yarn
COPY . .
ENTRYPOINT node src/index.js